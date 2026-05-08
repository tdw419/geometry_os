; DESCRIPTION: Geometry OS program to draw a red object.

; wirecube.asm -- 3D rotating wireframe cube
;
; A wireframe cube tumbles in 3D space with perspective projection
; and depth-based edge coloring. Uses parabolic sin/cos approximation
; for rotation math -- no lookup table needed.
;
; Math:
;   sin(a) ≈ t*(32768-t) >> 20 where t = a folded to [0, 32767]
;   cos(a) = sin(a + 16384)
;   Y rotation: rx = (vx*cos - vz*sin) >> 8, rz = (vx*sin + vz*cos) >> 8
;   X rotation: ry = (vy*cos - rz*sin) >> 8, rz2 = (vy*sin + rz*cos) >> 8
;   Perspective: scale = 200 - (rz2 >> 3)
;                sx = (rx * scale) >> 8 + 128
;                sy = (ry * scale) >> 8 + 128
;
; Vertices stored as signed 8.8 fixed-point at 0x1000-0x1017.
; Coordinates are +/- 80 (fits on 256x256 screen at any rotation angle).
;
; Memory layout (word addresses):
;   0x1000-0x1017: 8 cube vertices (vx, vy, vz) in 8.8 fixed-point
;   0x1020-0x102F: 8 projected 2D points (sx, sy)
;   0x1030-0x1037: 8 rotated Z values (depth coloring)
;   0x1040-0x1057: 12 edge index pairs (va, vb)
;
; Register allocation:
;   r7  = angle_y
;   r6  = angle_x
;   r1  = loop counter
;   r8-r0 = scratch / pointers
;   r10-r14 = sin/cos values
;   r13-r19 = rotation scratch
;   r20 = edge counter
;   r21 = edge list pointer
;   r22-r23 = edge vertex indices
;   r24-r27 = LINE args (sx_a, sy_a, sx_b, sy_b)
;   r28 = color
;   r29 = temp

; ============================================================
; INITIALIZATION
; ============================================================

; --- Store 8 cube vertices at 0x1000 ---
; Vertex i: x = bit2 ? -80 : 80, y = bit1 ? -80 : 80, z = bit0 ? -80 : 80
; Using 80 keeps all projected vertices within 256x256 screen
LDI r1, 0
LDI r8, 0x1000

vert_init:
  MOV r12, r1
  ANDI r12, 4
  JNZ r12, xi_neg
  LDI r12, 80
  JMP xi_store
xi_neg:
  LDI r12, 0xFFFFFFB0  ; -80 in u32
xi_store:
  STORE r8, r12
  ADDI r8, 1

  MOV r12, r1
  ANDI r12, 2
  JNZ r12, yi_neg
  LDI r12, 80
  JMP yi_store
yi_neg:
  LDI r12, 0xFFFFFFB0
yi_store:
  STORE r8, r12
  ADDI r8, 1

  MOV r12, r1
  ANDI r12, 1
  JNZ r12, zi_neg
  LDI r12, 80
  JMP zi_store
zi_neg:
  LDI r12, 0xFFFFFFB0
zi_store:
  STORE r8, r12
  ADDI r8, 1

  ADDI r1, 1
  LDI r29, 8
  CMP r1, r29
  BLT r9, vert_init

; --- Store 12 edge index pairs at 0x1040 ---
LDI r1, 0
LDI r8, 0x1040

edge_init:
  MOV r12, r1
  ANDI r12, 1
  JNZ r12, eisz
  STORE r8, r1
  ADDI r8, 1
  MOV r12, r1
  ORI r12, 1
  STORE r8, r12
  ADDI r8, 1
eisz:
  MOV r12, r1
  ANDI r12, 2
  JNZ r12, eisy
  STORE r8, r1
  ADDI r8, 1
  MOV r12, r1
  ORI r12, 2
  STORE r8, r12
  ADDI r8, 1
eisy:
  MOV r12, r1
  ANDI r12, 4
  JNZ r12, eisx
  STORE r8, r1
  ADDI r8, 1
  MOV r12, r1
  ORI r12, 4
  STORE r8, r12
  ADDI r8, 1
eisx:
  ADDI r1, 1
  LDI r29, 8
  CMP r1, r29
  BLT r9, edge_init

; Initialize rotation angles
LDI r7, 0
LDI r6, 0

; ============================================================
; MAIN ANIMATION LOOP
; ============================================================
main_loop:
  ; Clear screen to black
  LDI r28, 0
  FILL r28

  ; Update angles every 3rd frame
  LDI r29, 0xFFE
  LOAD r29, r29
  ANDI r29, 3
  JNZ r29, skip_angle
  ADDI r7, 800
  ANDI r7, 0xFFFF
  ADDI r6, 550
  ANDI r6, 0xFFFF
skip_angle:

  ; ============================================================
  ; COMPUTE sin_y, cos_y, sin_x, cos_x
  ; parabolic_sin(a): fold a to [0,32767], compute t*(32768-t)>>20
  ; ============================================================

  ; sin_y = parabolic_sin(angle_y)
  MOV r11, r7
  LDI r16, 0
  LDI r17, 32768
  CMP r11, r17
  BLT r9, sy_first
  LDI r16, 1
  SUB r11, r17
sy_first:
  MOV r17, r11
  LDI r10, 32768
  SUB r10, r17
  MUL r11, r10
  SHRI r11, 20
  JZ r16, sy_done
  NEG r11
sy_done:
  MOV r10, r11

  ; cos_y = parabolic_sin(angle_y + 16384)
  MOV r11, r7
  ADDI r11, 16384
  LDI r17, 65536
  CMP r11, r17
  BLT r9, cy_wrap
  SUB r11, r17
cy_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r11, r17
  BLT r9, cy_first
  LDI r16, 1
  SUB r11, r17
cy_first:
  MOV r17, r11
  LDI r2, 32768
  SUB r2, r17
  MUL r11, r2
  SHRI r11, 20
  JZ r16, cy_done
  NEG r11
cy_done:
  MOV r2, r11

  ; sin_x = parabolic_sin(angle_x)
  MOV r11, r6
  LDI r16, 0
  LDI r17, 32768
  CMP r11, r17
  BLT r9, sx_first
  LDI r16, 1
  SUB r11, r17
sx_first:
  MOV r17, r11
  LDI r15, 32768
  SUB r15, r17
  MUL r11, r15
  SHRI r11, 20
  JZ r16, sx_done
  NEG r11
sx_done:
  MOV r15, r11

  ; cos_x = parabolic_sin(angle_x + 16384)
  MOV r11, r6
  ADDI r11, 16384
  LDI r17, 65536
  CMP r11, r17
  BLT r9, cx_wrap
  SUB r11, r17
cx_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r11, r17
  BLT r9, cx_first
  LDI r16, 1
  SUB r11, r17
cx_first:
  MOV r17, r11
  LDI r14, 32768
  SUB r14, r17
  MUL r11, r14
  SHRI r11, 20
  JZ r16, cx_done
  NEG r11
cx_done:
  MOV r14, r11

  ; ============================================================
  ; ROTATE AND PROJECT ALL 8 VERTICES
  ; ============================================================
  LDI r1, 0
  LDI r29, 8

vert_loop:
  ; Compute vertex RAM address: 0x1000 + i*3
  MOV r8, r1
  SHLI r8, 1
  ADD r8, r1
  ADDI r8, 0x1000

  ; Load vertex (vx, vy, vz)
  LOAD r12, r8       ; vx
  ADDI r8, 1
  LOAD r5, r8       ; vy
  ADDI r8, 1
  LOAD r0, r8       ; vz

  ; Y-axis rotation:
  ; rx = (vx * cos_y - vz * sin_y) >> 8
  ; rz = (vx * sin_y + vz * cos_y) >> 8
  ; With 8-bit coords (80) and 8.8 sin/cos (max 256), products fit in u32
  MOV r13, r12
  MUL r13, r2       ; vx * cos_y
  MOV r3, r0
  MUL r3, r10       ; vz * sin_y
  SUB r13, r3      ; vx*cos_y - vz*sin_y
  SARI r13, 8       ; rx

  MOV r4, r12
  MUL r4, r10       ; vx * sin_y
  MOV r17, r0
  MUL r17, r2       ; vz * cos_y
  ADD r4, r17      ; vx*sin_y + vz*cos_y
  SARI r4, 8       ; rz

  ; X-axis rotation:
  ; ry = (vy * cos_x - rz * sin_x) >> 8
  ; rz2 = (vy * sin_x + rz * cos_x) >> 8
  MOV r16, r5
  MUL r16, r14      ; vy * cos_x
  MOV r17, r4
  MUL r17, r15      ; rz * sin_x
  SUB r16, r17      ; vy*cos_x - rz*sin_x
  SARI r16, 8       ; ry

  MOV r17, r5
  MUL r17, r15      ; vy * sin_x
  MOV r11, r4
  MUL r11, r14      ; rz * cos_x
  ADD r17, r11      ; vy*sin_x + rz*cos_x
  SARI r17, 8       ; rz2

  ; Store rotated Z at 0x1030 + i
  MOV r8, r1
  ADDI r8, 0x1030
  STORE r8, r17

  ; Perspective: scale = 200 - (rz2 >> 3)
  ; rz2 ranges from about -170 to 170 (after rotation of +/-120)
  ; So rz2>>3 ranges from -21 to 21, scale ranges from 179 to 221
  MOV r19, r17
  SARI r19, 3
  LDI r8, 200
  SUB r19, r8       ; scale = 200 - (rz2>>3)

  ; sx = (rx * scale) >> 8 + 128
  MOV r18, r13
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sx at 0x1020 + i*2
  MOV r8, r1
  SHLI r8, 1
  ADDI r8, 0x1020
  STORE r8, r18

  ; sy = (ry * scale) >> 8 + 128
  MOV r18, r16
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sy at 0x1020 + i*2 + 1
  ADDI r8, 1
  STORE r8, r18

  ; Next vertex
  ADDI r1, 1
  CMP r1, r29
  BLT r9, vert_loop

  ; ============================================================
  ; DRAW 12 EDGES WITH DEPTH-BASED COLORING
  ; ============================================================
  LDI r20, 0
  LDI r8, 0x1040

edge_loop:
  ; Load edge vertex indices
  LOAD r22, r8
  ADDI r8, 1
  LOAD r23, r8
  ADDI r8, 1

  ; Load sx_a: 0x1020 + va*2
  MOV r12, r22
  SHLI r12, 1
  ADDI r12, 0x1020
  LOAD r24, r12

  ; Load sy_a
  ADDI r12, 1
  LOAD r25, r12

  ; Load sx_b: 0x1020 + vb*2
  MOV r12, r23
  SHLI r12, 1
  ADDI r12, 0x1020
  LOAD r26, r12

  ; Load sy_b
  ADDI r12, 1
  LOAD r27, r12

  ; Depth-based coloring: blue channel + green based on avg Z
  ; Load z_a and z_b
  MOV r12, r22
  ADDI r12, 0x1030
  LOAD r29, r12
  MOV r12, r23
  ADDI r12, 0x1030
  LOAD r0, r12

  ; avg_z = (z_a + z_b) >> 1
  ADD r29, r0
  SARI r29, 1

  ; green = clamp(128 + (avg_z >> 1), 0, 255) -- shifted for more variation
  MOV r0, r29
  SARI r0, 1
  LDI r12, 128
  ADD r0, r12
  ANDI r0, 0xFF

  ; Build color: R=0x40, G=green, B=0xFF
  ; color = (0xFF << 16) | (green << 8) | 0x40
  LDI r28, 0xFF
  SHLI r28, 8
  SHLI r28, 8
  SHLI r0, 8
  OR r28, r0
  LDI r12, 0x40
  OR r28, r12

  ; Draw the edge
  LINE r24, r25, r26, r27, r28

  ; Next edge
  ADDI r20, 1
  LDI r12, 12
  CMP r20, r12
  BLT r9, edge_loop

  ; Yield to renderer (single frame for test compatibility)
  FRAME
  HALT
