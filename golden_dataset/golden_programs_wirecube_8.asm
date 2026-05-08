; DESCRIPTION: The GeOS assembly code implements a 3D rotating wireframe cube with perspective projection and depth-based edge coloring. It uses parabolic approximations for sine and cosine calculations to perform Y and X-axis rotations on the cube's vertices, projects them onto a 2D plane, and then draws colored edges based on their depth.

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
;   r12  = angle_y
;   r2  = angle_x
;   r11  = loop counter
;   r0-r6 = scratch / pointers
;   r1-r14 = sin/cos values
;   r8-r19 = rotation scratch
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
LDI r11, 0
LDI r0, 0x1000

vert_init:
  MOV r15, r11
  ANDI r15, 4
  JNZ r15, xi_neg
  LDI r15, 80
  JMP xi_store
xi_neg:
  LDI r15, 0xFFFFFFB0  ; -80 in u32
xi_store:
  STORE r0, r15
  ADDI r0, 1

  MOV r15, r11
  ANDI r15, 2
  JNZ r15, yi_neg
  LDI r15, 80
  JMP yi_store
yi_neg:
  LDI r15, 0xFFFFFFB0
yi_store:
  STORE r0, r15
  ADDI r0, 1

  MOV r15, r11
  ANDI r15, 1
  JNZ r15, zi_neg
  LDI r15, 80
  JMP zi_store
zi_neg:
  LDI r15, 0xFFFFFFB0
zi_store:
  STORE r0, r15
  ADDI r0, 1

  ADDI r11, 1
  LDI r29, 8
  CMP r11, r29
  BLT r7, vert_init

; --- Store 12 edge index pairs at 0x1040 ---
LDI r11, 0
LDI r0, 0x1040

edge_init:
  MOV r15, r11
  ANDI r15, 1
  JNZ r15, eisz
  STORE r0, r11
  ADDI r0, 1
  MOV r15, r11
  ORI r15, 1
  STORE r0, r15
  ADDI r0, 1
eisz:
  MOV r15, r11
  ANDI r15, 2
  JNZ r15, eisy
  STORE r0, r11
  ADDI r0, 1
  MOV r15, r11
  ORI r15, 2
  STORE r0, r15
  ADDI r0, 1
eisy:
  MOV r15, r11
  ANDI r15, 4
  JNZ r15, eisx
  STORE r0, r11
  ADDI r0, 1
  MOV r15, r11
  ORI r15, 4
  STORE r0, r15
  ADDI r0, 1
eisx:
  ADDI r11, 1
  LDI r29, 8
  CMP r11, r29
  BLT r7, edge_init

; Initialize rotation angles
LDI r12, 0
LDI r2, 0

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
  ADDI r12, 800
  ANDI r12, 0xFFFF
  ADDI r2, 550
  ANDI r2, 0xFFFF
skip_angle:

  ; ============================================================
  ; COMPUTE sin_y, cos_y, sin_x, cos_x
  ; parabolic_sin(a): fold a to [0,32767], compute t*(32768-t)>>20
  ; ============================================================

  ; sin_y = parabolic_sin(angle_y)
  MOV r10, r12
  LDI r16, 0
  LDI r17, 32768
  CMP r10, r17
  BLT r7, sy_first
  LDI r16, 1
  SUB r10, r17
sy_first:
  MOV r17, r10
  LDI r1, 32768
  SUB r1, r17
  MUL r10, r1
  SHRI r10, 20
  JZ r16, sy_done
  NEG r10
sy_done:
  MOV r1, r10

  ; cos_y = parabolic_sin(angle_y + 16384)
  MOV r10, r12
  ADDI r10, 16384
  LDI r17, 65536
  CMP r10, r17
  BLT r7, cy_wrap
  SUB r10, r17
cy_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r10, r17
  BLT r7, cy_first
  LDI r16, 1
  SUB r10, r17
cy_first:
  MOV r17, r10
  LDI r4, 32768
  SUB r4, r17
  MUL r10, r4
  SHRI r10, 20
  JZ r16, cy_done
  NEG r10
cy_done:
  MOV r4, r10

  ; sin_x = parabolic_sin(angle_x)
  MOV r10, r2
  LDI r16, 0
  LDI r17, 32768
  CMP r10, r17
  BLT r7, sx_first
  LDI r16, 1
  SUB r10, r17
sx_first:
  MOV r17, r10
  LDI r3, 32768
  SUB r3, r17
  MUL r10, r3
  SHRI r10, 20
  JZ r16, sx_done
  NEG r10
sx_done:
  MOV r3, r10

  ; cos_x = parabolic_sin(angle_x + 16384)
  MOV r10, r2
  ADDI r10, 16384
  LDI r17, 65536
  CMP r10, r17
  BLT r7, cx_wrap
  SUB r10, r17
cx_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r10, r17
  BLT r7, cx_first
  LDI r16, 1
  SUB r10, r17
cx_first:
  MOV r17, r10
  LDI r14, 32768
  SUB r14, r17
  MUL r10, r14
  SHRI r10, 20
  JZ r16, cx_done
  NEG r10
cx_done:
  MOV r14, r10

  ; ============================================================
  ; ROTATE AND PROJECT ALL 8 VERTICES
  ; ============================================================
  LDI r11, 0
  LDI r29, 8

vert_loop:
  ; Compute vertex RAM address: 0x1000 + i*3
  MOV r0, r11
  SHLI r0, 1
  ADD r0, r11
  ADDI r0, 0x1000

  ; Load vertex (vx, vy, vz)
  LOAD r15, r0       ; vx
  ADDI r0, 1
  LOAD r9, r0       ; vy
  ADDI r0, 1
  LOAD r6, r0       ; vz

  ; Y-axis rotation:
  ; rx = (vx * cos_y - vz * sin_y) >> 8
  ; rz = (vx * sin_y + vz * cos_y) >> 8
  ; With 8-bit coords (80) and 8.8 sin/cos (max 256), products fit in u32
  MOV r8, r15
  MUL r8, r4       ; vx * cos_y
  MOV r5, r6
  MUL r5, r1       ; vz * sin_y
  SUB r8, r5      ; vx*cos_y - vz*sin_y
  SARI r8, 8       ; rx

  MOV r13, r15
  MUL r13, r1       ; vx * sin_y
  MOV r17, r6
  MUL r17, r4       ; vz * cos_y
  ADD r13, r17      ; vx*sin_y + vz*cos_y
  SARI r13, 8       ; rz

  ; X-axis rotation:
  ; ry = (vy * cos_x - rz * sin_x) >> 8
  ; rz2 = (vy * sin_x + rz * cos_x) >> 8
  MOV r16, r9
  MUL r16, r14      ; vy * cos_x
  MOV r17, r13
  MUL r17, r3      ; rz * sin_x
  SUB r16, r17      ; vy*cos_x - rz*sin_x
  SARI r16, 8       ; ry

  MOV r17, r9
  MUL r17, r3      ; vy * sin_x
  MOV r10, r13
  MUL r10, r14      ; rz * cos_x
  ADD r17, r10      ; vy*sin_x + rz*cos_x
  SARI r17, 8       ; rz2

  ; Store rotated Z at 0x1030 + i
  MOV r0, r11
  ADDI r0, 0x1030
  STORE r0, r17

  ; Perspective: scale = 200 - (rz2 >> 3)
  ; rz2 ranges from about -170 to 170 (after rotation of +/-120)
  ; So rz2>>3 ranges from -21 to 21, scale ranges from 179 to 221
  MOV r19, r17
  SARI r19, 3
  LDI r0, 200
  SUB r19, r0       ; scale = 200 - (rz2>>3)

  ; sx = (rx * scale) >> 8 + 128
  MOV r18, r8
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sx at 0x1020 + i*2
  MOV r0, r11
  SHLI r0, 1
  ADDI r0, 0x1020
  STORE r0, r18

  ; sy = (ry * scale) >> 8 + 128
  MOV r18, r16
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sy at 0x1020 + i*2 + 1
  ADDI r0, 1
  STORE r0, r18

  ; Next vertex
  ADDI r11, 1
  CMP r11, r29
  BLT r7, vert_loop

  ; ============================================================
  ; DRAW 12 EDGES WITH DEPTH-BASED COLORING
  ; ============================================================
  LDI r20, 0
  LDI r0, 0x1040

edge_loop:
  ; Load edge vertex indices
  LOAD r22, r0
  ADDI r0, 1
  LOAD r23, r0
  ADDI r0, 1

  ; Load sx_a: 0x1020 + va*2
  MOV r15, r22
  SHLI r15, 1
  ADDI r15, 0x1020
  LOAD r24, r15

  ; Load sy_a
  ADDI r15, 1
  LOAD r25, r15

  ; Load sx_b: 0x1020 + vb*2
  MOV r15, r23
  SHLI r15, 1
  ADDI r15, 0x1020
  LOAD r26, r15

  ; Load sy_b
  ADDI r15, 1
  LOAD r27, r15

  ; Depth-based coloring: blue channel + green based on avg Z
  ; Load z_a and z_b
  MOV r15, r22
  ADDI r15, 0x1030
  LOAD r29, r15
  MOV r15, r23
  ADDI r15, 0x1030
  LOAD r6, r15

  ; avg_z = (z_a + z_b) >> 1
  ADD r29, r6
  SARI r29, 1

  ; green = clamp(128 + (avg_z >> 1), 0, 255) -- shifted for more variation
  MOV r6, r29
  SARI r6, 1
  LDI r15, 128
  ADD r6, r15
  ANDI r6, 0xFF

  ; Build color: R=0x40, G=green, B=0xFF
  ; color = (0xFF << 16) | (green << 8) | 0x40
  LDI r28, 0xFF
  SHLI r28, 8
  SHLI r28, 8
  SHLI r6, 8
  OR r28, r6
  LDI r15, 0x40
  OR r28, r15

  ; Draw the edge
  LINE r24, r25, r26, r27, r28

  ; Next edge
  ADDI r20, 1
  LDI r15, 12
  CMP r20, r15
  BLT r7, edge_loop

  ; Yield to renderer (single frame for test compatibility)
  FRAME
  HALT
