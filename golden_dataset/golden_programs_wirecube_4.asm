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
;   r15  = angle_y
;   r0  = angle_x
;   r10  = loop counter
;   r6-r5 = scratch / pointers
;   r8-r13 = sin/cos values
;   r9-r19 = rotation scratch
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
LDI r10, 0
LDI r6, 0x1000

vert_init:
  MOV r2, r10
  ANDI r2, 4
  JNZ r2, xi_neg
  LDI r2, 80
  JMP xi_store
xi_neg:
  LDI r2, 0xFFFFFFB0  ; -80 in u32
xi_store:
  STORE r6, r2
  ADDI r6, 1

  MOV r2, r10
  ANDI r2, 2
  JNZ r2, yi_neg
  LDI r2, 80
  JMP yi_store
yi_neg:
  LDI r2, 0xFFFFFFB0
yi_store:
  STORE r6, r2
  ADDI r6, 1

  MOV r2, r10
  ANDI r2, 1
  JNZ r2, zi_neg
  LDI r2, 80
  JMP zi_store
zi_neg:
  LDI r2, 0xFFFFFFB0
zi_store:
  STORE r6, r2
  ADDI r6, 1

  ADDI r10, 1
  LDI r29, 8
  CMP r10, r29
  BLT r7, vert_init

; --- Store 12 edge index pairs at 0x1040 ---
LDI r10, 0
LDI r6, 0x1040

edge_init:
  MOV r2, r10
  ANDI r2, 1
  JNZ r2, eisz
  STORE r6, r10
  ADDI r6, 1
  MOV r2, r10
  ORI r2, 1
  STORE r6, r2
  ADDI r6, 1
eisz:
  MOV r2, r10
  ANDI r2, 2
  JNZ r2, eisy
  STORE r6, r10
  ADDI r6, 1
  MOV r2, r10
  ORI r2, 2
  STORE r6, r2
  ADDI r6, 1
eisy:
  MOV r2, r10
  ANDI r2, 4
  JNZ r2, eisx
  STORE r6, r10
  ADDI r6, 1
  MOV r2, r10
  ORI r2, 4
  STORE r6, r2
  ADDI r6, 1
eisx:
  ADDI r10, 1
  LDI r29, 8
  CMP r10, r29
  BLT r7, edge_init

; Initialize rotation angles
LDI r15, 0
LDI r0, 0

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
  ADDI r15, 800
  ANDI r15, 0xFFFF
  ADDI r0, 550
  ANDI r0, 0xFFFF
skip_angle:

  ; ============================================================
  ; COMPUTE sin_y, cos_y, sin_x, cos_x
  ; parabolic_sin(a): fold a to [0,32767], compute t*(32768-t)>>20
  ; ============================================================

  ; sin_y = parabolic_sin(angle_y)
  MOV r3, r15
  LDI r16, 0
  LDI r17, 32768
  CMP r3, r17
  BLT r7, sy_first
  LDI r16, 1
  SUB r3, r17
sy_first:
  MOV r17, r3
  LDI r8, 32768
  SUB r8, r17
  MUL r3, r8
  SHRI r3, 20
  JZ r16, sy_done
  NEG r3
sy_done:
  MOV r8, r3

  ; cos_y = parabolic_sin(angle_y + 16384)
  MOV r3, r15
  ADDI r3, 16384
  LDI r17, 65536
  CMP r3, r17
  BLT r7, cy_wrap
  SUB r3, r17
cy_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r3, r17
  BLT r7, cy_first
  LDI r16, 1
  SUB r3, r17
cy_first:
  MOV r17, r3
  LDI r14, 32768
  SUB r14, r17
  MUL r3, r14
  SHRI r3, 20
  JZ r16, cy_done
  NEG r3
cy_done:
  MOV r14, r3

  ; sin_x = parabolic_sin(angle_x)
  MOV r3, r0
  LDI r16, 0
  LDI r17, 32768
  CMP r3, r17
  BLT r7, sx_first
  LDI r16, 1
  SUB r3, r17
sx_first:
  MOV r17, r3
  LDI r4, 32768
  SUB r4, r17
  MUL r3, r4
  SHRI r3, 20
  JZ r16, sx_done
  NEG r3
sx_done:
  MOV r4, r3

  ; cos_x = parabolic_sin(angle_x + 16384)
  MOV r3, r0
  ADDI r3, 16384
  LDI r17, 65536
  CMP r3, r17
  BLT r7, cx_wrap
  SUB r3, r17
cx_wrap:
  LDI r16, 0
  LDI r17, 32768
  CMP r3, r17
  BLT r7, cx_first
  LDI r16, 1
  SUB r3, r17
cx_first:
  MOV r17, r3
  LDI r13, 32768
  SUB r13, r17
  MUL r3, r13
  SHRI r3, 20
  JZ r16, cx_done
  NEG r3
cx_done:
  MOV r13, r3

  ; ============================================================
  ; ROTATE AND PROJECT ALL 8 VERTICES
  ; ============================================================
  LDI r10, 0
  LDI r29, 8

vert_loop:
  ; Compute vertex RAM address: 0x1000 + i*3
  MOV r6, r10
  SHLI r6, 1
  ADD r6, r10
  ADDI r6, 0x1000

  ; Load vertex (vx, vy, vz)
  LOAD r2, r6       ; vx
  ADDI r6, 1
  LOAD r1, r6       ; vy
  ADDI r6, 1
  LOAD r5, r6       ; vz

  ; Y-axis rotation:
  ; rx = (vx * cos_y - vz * sin_y) >> 8
  ; rz = (vx * sin_y + vz * cos_y) >> 8
  ; With 8-bit coords (80) and 8.8 sin/cos (max 256), products fit in u32
  MOV r9, r2
  MUL r9, r14       ; vx * cos_y
  MOV r12, r5
  MUL r12, r8       ; vz * sin_y
  SUB r9, r12      ; vx*cos_y - vz*sin_y
  SARI r9, 8       ; rx

  MOV r11, r2
  MUL r11, r8       ; vx * sin_y
  MOV r17, r5
  MUL r17, r14       ; vz * cos_y
  ADD r11, r17      ; vx*sin_y + vz*cos_y
  SARI r11, 8       ; rz

  ; X-axis rotation:
  ; ry = (vy * cos_x - rz * sin_x) >> 8
  ; rz2 = (vy * sin_x + rz * cos_x) >> 8
  MOV r16, r1
  MUL r16, r13      ; vy * cos_x
  MOV r17, r11
  MUL r17, r4      ; rz * sin_x
  SUB r16, r17      ; vy*cos_x - rz*sin_x
  SARI r16, 8       ; ry

  MOV r17, r1
  MUL r17, r4      ; vy * sin_x
  MOV r3, r11
  MUL r3, r13      ; rz * cos_x
  ADD r17, r3      ; vy*sin_x + rz*cos_x
  SARI r17, 8       ; rz2

  ; Store rotated Z at 0x1030 + i
  MOV r6, r10
  ADDI r6, 0x1030
  STORE r6, r17

  ; Perspective: scale = 200 - (rz2 >> 3)
  ; rz2 ranges from about -170 to 170 (after rotation of +/-120)
  ; So rz2>>3 ranges from -21 to 21, scale ranges from 179 to 221
  MOV r19, r17
  SARI r19, 3
  LDI r6, 200
  SUB r19, r6       ; scale = 200 - (rz2>>3)

  ; sx = (rx * scale) >> 8 + 128
  MOV r18, r9
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sx at 0x1020 + i*2
  MOV r6, r10
  SHLI r6, 1
  ADDI r6, 0x1020
  STORE r6, r18

  ; sy = (ry * scale) >> 8 + 128
  MOV r18, r16
  MUL r18, r19
  SARI r18, 8
  ADDI r18, 128

  ; Store sy at 0x1020 + i*2 + 1
  ADDI r6, 1
  STORE r6, r18

  ; Next vertex
  ADDI r10, 1
  CMP r10, r29
  BLT r7, vert_loop

  ; ============================================================
  ; DRAW 12 EDGES WITH DEPTH-BASED COLORING
  ; ============================================================
  LDI r20, 0
  LDI r6, 0x1040

edge_loop:
  ; Load edge vertex indices
  LOAD r22, r6
  ADDI r6, 1
  LOAD r23, r6
  ADDI r6, 1

  ; Load sx_a: 0x1020 + va*2
  MOV r2, r22
  SHLI r2, 1
  ADDI r2, 0x1020
  LOAD r24, r2

  ; Load sy_a
  ADDI r2, 1
  LOAD r25, r2

  ; Load sx_b: 0x1020 + vb*2
  MOV r2, r23
  SHLI r2, 1
  ADDI r2, 0x1020
  LOAD r26, r2

  ; Load sy_b
  ADDI r2, 1
  LOAD r27, r2

  ; Depth-based coloring: blue channel + green based on avg Z
  ; Load z_a and z_b
  MOV r2, r22
  ADDI r2, 0x1030
  LOAD r29, r2
  MOV r2, r23
  ADDI r2, 0x1030
  LOAD r5, r2

  ; avg_z = (z_a + z_b) >> 1
  ADD r29, r5
  SARI r29, 1

  ; green = clamp(128 + (avg_z >> 1), 0, 255) -- shifted for more variation
  MOV r5, r29
  SARI r5, 1
  LDI r2, 128
  ADD r5, r2
  ANDI r5, 0xFF

  ; Build color: R=0x40, G=green, B=0xFF
  ; color = (0xFF << 16) | (green << 8) | 0x40
  LDI r28, 0xFF
  SHLI r28, 8
  SHLI r28, 8
  SHLI r5, 8
  OR r28, r5
  LDI r2, 0x40
  OR r28, r2

  ; Draw the edge
  LINE r24, r25, r26, r27, r28

  ; Next edge
  ADDI r20, 1
  LDI r2, 12
  CMP r20, r2
  BLT r7, edge_loop

  ; Yield to renderer (single frame for test compatibility)
  FRAME
  HALT
