; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit

; === CONSTANTS ===
LDI r15, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r14, 0x5000
LDI r8, 0x000066
STORE r14, r8
ADD r14, r15
LDI r8, 0x0000CC
STORE r14, r8
ADD r14, r15
LDI r8, 0x0044FF
STORE r14, r8
ADD r14, r15
LDI r8, 0x00AAFF
STORE r14, r8
ADD r14, r15
LDI r8, 0x00FFCC
STORE r14, r8
ADD r14, r15
LDI r8, 0x00FF44
STORE r14, r8
ADD r14, r15
LDI r8, 0x44FF00
STORE r14, r8
ADD r14, r15
LDI r8, 0xAAFF00
STORE r14, r8
ADD r14, r15
LDI r8, 0xFFEE00
STORE r14, r8
ADD r14, r15
LDI r8, 0xFFAA00
STORE r14, r8
ADD r14, r15
LDI r8, 0xFF4400
STORE r14, r8
ADD r14, r15
LDI r8, 0xFF0000
STORE r14, r8
ADD r14, r15
LDI r8, 0xDD0044
STORE r14, r8
ADD r14, r15
LDI r8, 0xAA00AA
STORE r14, r8
ADD r14, r15
LDI r8, 0x550077
STORE r14, r8
ADD r14, r15
LDI r8, 0x220044
STORE r14, r8
ADD r14, r15

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r14, 0x5100
LDI r8, 2048
NEG r8
STORE r14, r8
ADD r14, r15
; center_im = 0.0
LDI r8, 0
STORE r14, r8
ADD r14, r15
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r8, 6144
STORE r14, r8
ADD r14, r15
; max_iter = 24
LDI r8, 24
STORE r14, r8

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  FRAME
  IKEY r10
  LDI r9, 43
  CMP r10, r9
  JZ r0, zoom_in
  LDI r9, 45
  CMP r10, r9
  JZ r0, zoom_out
  LDI r9, 87
  CMP r10, r9
  JZ r0, pan_up
  LDI r9, 83
  CMP r10, r9
  JZ r0, pan_down
  LDI r9, 65
  CMP r10, r9
  JZ r0, pan_left
  LDI r9, 68
  CMP r10, r9
  JZ r0, pan_right
  LDI r9, 82
  CMP r10, r9
  JZ r0, reset_view
  LDI r9, 81
  CMP r10, r9
  JZ r0, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r14, 0x5102
  LOAD r9, r14
  SAR r9, r17
  STORE r14, r9
  JMP main_loop

zoom_out:
  LDI r14, 0x5102
  LOAD r9, r14
  SHL r9, r17
  LDI r10, 24576
  CMP r9, r10
  BGE r0, main_loop
  STORE r14, r9
  JMP main_loop

pan_up:
  LDI r14, 0x5101
  LOAD r9, r14
  LDI r10, 0x5102
  LOAD r11, r10
  SAR r11, r17
  SAR r11, r17
  SAR r11, r17
  SUB r9, r11
  STORE r14, r9
  JMP main_loop

pan_down:
  LDI r14, 0x5101
  LOAD r9, r14
  LDI r10, 0x5102
  LOAD r11, r10
  SAR r11, r17
  SAR r11, r17
  SAR r11, r17
  ADD r9, r11
  STORE r14, r9
  JMP main_loop

pan_left:
  LDI r14, 0x5100
  LOAD r9, r14
  LDI r10, 0x5102
  LOAD r11, r10
  SAR r11, r17
  SAR r11, r17
  SAR r11, r17
  SUB r9, r11
  STORE r14, r9
  JMP main_loop

pan_right:
  LDI r14, 0x5100
  LOAD r9, r14
  LDI r10, 0x5102
  LOAD r11, r10
  SAR r11, r17
  SAR r11, r17
  SAR r11, r17
  ADD r9, r11
  STORE r14, r9
  JMP main_loop

reset_view:
  LDI r14, 0x5100
  LDI r8, 2048
  NEG r8
  STORE r14, r8
  ADD r14, r15
  LDI r8, 0
  STORE r14, r8
  ADD r14, r15
  LDI r8, 6144
  STORE r14, r8
  ADD r14, r15
  LDI r8, 24
  STORE r14, r8
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r8, 0
  FILL r8
  LDI r14, 0x5100
  LOAD r28, r14
  ADD r14, r15
  LOAD r29, r14
  ADD r14, r15
  LOAD r12, r14
  ADD r14, r15
  LOAD r13, r14
  LDI r2, 0
y_loop:
  LDI r1, 0
  MOV r8, r2
  SHL r8, r17
  ADD r8, r15
  SUB r8, r16
  MUL r8, r12
  SAR r8, r20
  ADD r8, r29
  MOV r6, r8
x_loop:
  MOV r8, r1
  SHL r8, r17
  ADD r8, r15
  SUB r8, r16
  MUL r8, r12
  SAR r8, r20
  ADD r8, r28
  MOV r5, r8
  LDI r3, 0
  LDI r4, 0
  LDI r7, 0
iter:
  MOV r8, r3
  MUL r8, r8
  MOV r10, r8
  MOV r9, r4
  MUL r9, r9
  ADD r10, r9
  CMP r10, r21
  BGE r0, escaped
  CMP r7, r13
  BGE r0, in_set
  SAR r8, r18
  SAR r9, r18
  SUB r8, r9
  ADD r8, r5
  MUL r3, r4
  SAR r3, r19
  ADD r3, r6
  MOV r4, r3
  MOV r3, r8
  ADD r7, r15
  JMP iter
escaped:
  LDI r9, 15
  AND r7, r9
  LDI r10, 0x5000
  ADD r7, r10
  LOAD r14, r7
  JMP draw
in_set:
  LDI r14, 0
draw:
  MOV r8, r1
  SHL r8, r17
  MOV r9, r2
  SHL r9, r17
  RECTF r8, r9, r17, r17, r14
  ADD r1, r15
  CMP r1, r16
  BLT r0, x_loop
  ADD r2, r15
  CMP r2, r16
  BLT r0, y_loop
  POP r31
  RET
