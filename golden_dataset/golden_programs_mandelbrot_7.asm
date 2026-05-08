; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r8, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r10, 0x5000
LDI r14, 0x000066
STORE r10, r14
ADD r10, r8
LDI r14, 0x0000CC
STORE r10, r14
ADD r10, r8
LDI r14, 0x0044FF
STORE r10, r14
ADD r10, r8
LDI r14, 0x00AAFF
STORE r10, r14
ADD r10, r8
LDI r14, 0x00FFCC
STORE r10, r14
ADD r10, r8
LDI r14, 0x00FF44
STORE r10, r14
ADD r10, r8
LDI r14, 0x44FF00
STORE r10, r14
ADD r10, r8
LDI r14, 0xAAFF00
STORE r10, r14
ADD r10, r8
LDI r14, 0xFFEE00
STORE r10, r14
ADD r10, r8
LDI r14, 0xFFAA00
STORE r10, r14
ADD r10, r8
LDI r14, 0xFF4400
STORE r10, r14
ADD r10, r8
LDI r14, 0xFF0000
STORE r10, r14
ADD r10, r8
LDI r14, 0xDD0044
STORE r10, r14
ADD r10, r8
LDI r14, 0xAA00AA
STORE r10, r14
ADD r10, r8
LDI r14, 0x550077
STORE r10, r14
ADD r10, r8
LDI r14, 0x220044
STORE r10, r14

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r10, 0x5100
LDI r14, 2048
NEG r14
STORE r10, r14
ADD r10, r8
; center_im = 0.0
LDI r14, 0
STORE r10, r14
ADD r10, r8
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r14, 6144
STORE r10, r14
ADD r10, r8
; max_iter = 24
LDI r14, 24
STORE r10, r14

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r0
  LDI r13, 43
  CMP r0, r13
  JZ r9, zoom_in
  LDI r13, 45
  CMP r0, r13
  JZ r9, zoom_out
  LDI r13, 87
  CMP r0, r13
  JZ r9, pan_up
  LDI r13, 83
  CMP r0, r13
  JZ r9, pan_down
  LDI r13, 65
  CMP r0, r13
  JZ r9, pan_left
  LDI r13, 68
  CMP r0, r13
  JZ r9, pan_right
  LDI r13, 82
  CMP r0, r13
  JZ r9, reset_view
  LDI r13, 81
  CMP r0, r13
  JZ r9, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r10, 0x5102
  LOAD r13, r10
  SAR r13, r17
  STORE r10, r13
  JMP main_loop

zoom_out:
  LDI r10, 0x5102
  LOAD r13, r10
  SHL r13, r17
  LDI r0, 24576
  CMP r13, r0
  BGE r9, main_loop
  STORE r10, r13
  JMP main_loop

pan_up:
  LDI r10, 0x5101
  LOAD r13, r10
  LDI r0, 0x5102
  LOAD r4, r0
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  SUB r13, r4
  STORE r10, r13
  JMP main_loop

pan_down:
  LDI r10, 0x5101
  LOAD r13, r10
  LDI r0, 0x5102
  LOAD r4, r0
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  ADD r13, r4
  STORE r10, r13
  JMP main_loop

pan_left:
  LDI r10, 0x5100
  LOAD r13, r10
  LDI r0, 0x5102
  LOAD r4, r0
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  SUB r13, r4
  STORE r10, r13
  JMP main_loop

pan_right:
  LDI r10, 0x5100
  LOAD r13, r10
  LDI r0, 0x5102
  LOAD r4, r0
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  ADD r13, r4
  STORE r10, r13
  JMP main_loop

reset_view:
  LDI r10, 0x5100
  LDI r14, 2048
  NEG r14
  STORE r10, r14
  ADD r10, r8
  LDI r14, 0
  STORE r10, r14
  ADD r10, r8
  LDI r14, 6144
  STORE r10, r14
  ADD r10, r8
  LDI r14, 24
  STORE r10, r14
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r14, 0
  FILL r14
  LDI r10, 0x5100
  LOAD r28, r10
  ADD r10, r8
  LOAD r29, r10
  ADD r10, r8
  LOAD r12, r10
  ADD r10, r8
  LOAD r15, r10
  LDI r3, 0
y_loop:
  LDI r6, 0
  MOV r14, r3
  SHL r14, r17
  ADD r14, r8
  SUB r14, r16
  MUL r14, r12
  SAR r14, r20
  ADD r14, r29
  MOV r2, r14
x_loop:
  MOV r14, r6
  SHL r14, r17
  ADD r14, r8
  SUB r14, r16
  MUL r14, r12
  SAR r14, r20
  ADD r14, r28
  MOV r11, r14
  LDI r7, 0
  LDI r1, 0
  LDI r5, 0
iter:
  MOV r14, r7
  MUL r14, r14
  MOV r0, r14
  MOV r13, r1
  MUL r13, r13
  ADD r0, r13
  CMP r0, r21
  BGE r9, escaped
  CMP r5, r15
  BGE r9, in_set
  SAR r14, r18
  SAR r13, r18
  SUB r14, r13
  ADD r14, r11
  MUL r7, r1
  SAR r7, r19
  ADD r7, r2
  MOV r1, r7
  MOV r7, r14
  ADD r5, r8
  JMP iter
escaped:
  LDI r13, 15
  AND r5, r13
  LDI r0, 0x5000
  ADD r5, r0
  LOAD r10, r5
  JMP draw
in_set:
  LDI r10, 0
draw:
  MOV r14, r6
  SHL r14, r17
  MOV r13, r3
  SHL r13, r17
  RECTF r14, r13, r17, r17, r10
  ADD r6, r8
  CMP r6, r16
  BLT r9, x_loop
  ADD r3, r8
  CMP r3, r16
  BLT r9, y_loop
  POP r31
  RET

; === HUD DRAWING ===
; Draws center coordinates and zoom level as text overlay
; Uses fixed-point 4.12: value / 4096 = real number
; HUD text buffer at 0x5200 (128 bytes)
; Display format:
;   RE: -0.5000  IM: 0.0000  Z: 1.5000
;   [+/-] zoom  [WASD] pan  [R] reset
draw_hud:
  PUSH r31
  ; Save view params we need
  LDI r10, 0x5100
  LOAD r22, r10       ; r22 = center_re (fixed-point)
  ADD r10, r8
  LOAD r23, r10       ; r23 = center_im (fixed-point)
  ADD r10, r8
  LOAD r24, r10       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r14, 82
  STORE r25, r14
  ADD r25, r8
  LDI r14, 69
  STORE r25, r14
  ADD r25, r8
  LDI r14, 58
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 73
  STORE r25, r14
  ADD r25, r8
  LDI r14, 77
  STORE r25, r14
  ADD r25, r8
  LDI r14, 58
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 90
  STORE r25, r14
  ADD r25, r8
  LDI r14, 58
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r14, 0
  STORE r25, r14

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r14, 91
  STORE r25, r14
  ADD r25, r8
  LDI r14, 43
  STORE r25, r14
  ADD r25, r8
  LDI r14, 47
  STORE r25, r14
  ADD r25, r8
  LDI r14, 45
  STORE r25, r14
  ADD r25, r8
  LDI r14, 93
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 122
  STORE r25, r14
  ADD r25, r8
  LDI r14, 111
  STORE r25, r14
  ADD r25, r8
  LDI r14, 111
  STORE r25, r14
  ADD r25, r8
  LDI r14, 109
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 91
  STORE r25, r14
  ADD r25, r8
  LDI r14, 87
  STORE r25, r14
  ADD r25, r8
  LDI r14, 65
  STORE r25, r14
  ADD r25, r8
  LDI r14, 83
  STORE r25, r14
  ADD r25, r8
  LDI r14, 68
  STORE r25, r14
  ADD r25, r8
  LDI r14, 93
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 112
  STORE r25, r14
  ADD r25, r8
  LDI r14, 97
  STORE r25, r14
  ADD r25, r8
  LDI r14, 110
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 91
  STORE r25, r14
  ADD r25, r8
  LDI r14, 82
  STORE r25, r14
  ADD r25, r8
  LDI r14, 93
  STORE r25, r14
  ADD r25, r8
  LDI r14, 32
  STORE r25, r14
  ADD r25, r8
  LDI r14, 114
  STORE r25, r14
  ADD r25, r8
  LDI r14, 101
  STORE r25, r14
  ADD r25, r8
  LDI r14, 115
  STORE r25, r14
  ADD r25, r8
  LDI r14, 101
  STORE r25, r14
  ADD r25, r8
  LDI r14, 116
  STORE r25, r14
  ADD r25, r8
  ; null terminate
  LDI r14, 0
  STORE r25, r14

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r0, 4
  LDI r4, 4
  LDI r12, 0x5200
  LDI r15, 0xFFFFFF
  LDI r10, 0x000000
  DRAWTEXT r0, r4, r12, r15, r10

  ; Line 2 at (4, 14) in dim gray
  LDI r0, 4
  LDI r4, 14
  LDI r12, 0x5280
  LDI r15, 0x888888
  LDI r10, 0x000000
  DRAWTEXT r0, r4, r12, r15, r10

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r6-r13
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r14, 0x80000000
  MOV r6, r22
  AND r6, r14
  JZ r6, hfs_positive
  ; Negative: write '-', negate value
  LDI r14, 45
  STORE r25, r14
  ADD r25, r8
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r6, r22
  SAR r6, r18        ; r6 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r6 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r14, 46
  STORE r25, r14
  ADD r25, r8
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r6, r22
  LDI r14, 0xFFF
  AND r6, r14         ; r6 = fractional bits (0-4095)
  LDI r14, 1000
  MUL r6, r14         ; r6 = frac * 1000
  LDI r14, 4096
  DIV r6, r14         ; r6 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r14, 100
  MOV r3, r6
  DIV r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  ; Tens digit
  MOV r3, r6
  LDI r14, 100
  MOD r3, r14
  LDI r14, 10
  DIV r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  ; Units digit
  MOV r3, r6
  LDI r14, 10
  MOD r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r6, r22
  SAR r6, r18        ; integer part
  CALL hud_write_u32
  LDI r14, 46
  STORE r25, r14
  ADD r25, r8
  MOV r6, r22
  LDI r14, 0xFFF
  AND r6, r14
  LDI r14, 1000
  MUL r6, r14
  LDI r14, 4096
  DIV r6, r14
  ; Hundreds
  LDI r14, 100
  MOV r3, r6
  DIV r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  ; Tens
  MOV r3, r6
  LDI r14, 100
  MOD r3, r14
  LDI r14, 10
  DIV r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  ; Units
  MOV r3, r6
  LDI r14, 10
  MOD r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r25, r3
  ADD r25, r8
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r6 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r6-r13
hud_write_u32:
  PUSH r31
  PUSH r0
  PUSH r4
  PUSH r12
  ; Special case: 0
  LDI r14, 0
  CMP r6, r14
  JNZ r9, hwu_nonzero
  LDI r14, 48
  STORE r25, r14
  ADD r25, r8
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r0, 0x5300    ; temp buffer
  LDI r4, 0         ; digit count
hwu_div_loop:
  LDI r14, 0
  CMP r6, r14
  JZ r9, hwu_flush
  LDI r14, 10
  MOV r3, r6
  MOD r3, r14
  LDI r14, 48
  ADD r3, r14
  STORE r0, r3
  ADD r0, r8
  ADD r4, r8
  LDI r14, 10
  DIV r6, r14
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r0, r8       ; point to last digit written
hwu_copy_loop:
  LDI r14, 0
  CMP r4, r14
  JZ r9, hwu_done
  LOAD r14, r0
  STORE r25, r14
  ADD r25, r8
  SUB r0, r8
  SUB r4, r8
  JMP hwu_copy_loop
hwu_done:
  POP r12
  POP r4
  POP r0
  POP r31
  RET
