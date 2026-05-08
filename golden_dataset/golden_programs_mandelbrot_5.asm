; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r11, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r4, 0x5000
LDI r15, 0x000066
STORE r4, r15
ADD r4, r11
LDI r15, 0x0000CC
STORE r4, r15
ADD r4, r11
LDI r15, 0x0044FF
STORE r4, r15
ADD r4, r11
LDI r15, 0x00AAFF
STORE r4, r15
ADD r4, r11
LDI r15, 0x00FFCC
STORE r4, r15
ADD r4, r11
LDI r15, 0x00FF44
STORE r4, r15
ADD r4, r11
LDI r15, 0x44FF00
STORE r4, r15
ADD r4, r11
LDI r15, 0xAAFF00
STORE r4, r15
ADD r4, r11
LDI r15, 0xFFEE00
STORE r4, r15
ADD r4, r11
LDI r15, 0xFFAA00
STORE r4, r15
ADD r4, r11
LDI r15, 0xFF4400
STORE r4, r15
ADD r4, r11
LDI r15, 0xFF0000
STORE r4, r15
ADD r4, r11
LDI r15, 0xDD0044
STORE r4, r15
ADD r4, r11
LDI r15, 0xAA00AA
STORE r4, r15
ADD r4, r11
LDI r15, 0x550077
STORE r4, r15
ADD r4, r11
LDI r15, 0x220044
STORE r4, r15

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r4, 0x5100
LDI r15, 2048
NEG r15
STORE r4, r15
ADD r4, r11
; center_im = 0.0
LDI r15, 0
STORE r4, r15
ADD r4, r11
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r15, 6144
STORE r4, r15
ADD r4, r11
; max_iter = 24
LDI r15, 24
STORE r4, r15

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r6
  LDI r7, 43
  CMP r6, r7
  JZ r9, zoom_in
  LDI r7, 45
  CMP r6, r7
  JZ r9, zoom_out
  LDI r7, 87
  CMP r6, r7
  JZ r9, pan_up
  LDI r7, 83
  CMP r6, r7
  JZ r9, pan_down
  LDI r7, 65
  CMP r6, r7
  JZ r9, pan_left
  LDI r7, 68
  CMP r6, r7
  JZ r9, pan_right
  LDI r7, 82
  CMP r6, r7
  JZ r9, reset_view
  LDI r7, 81
  CMP r6, r7
  JZ r9, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r4, 0x5102
  LOAD r7, r4
  SAR r7, r17
  STORE r4, r7
  JMP main_loop

zoom_out:
  LDI r4, 0x5102
  LOAD r7, r4
  SHL r7, r17
  LDI r6, 24576
  CMP r7, r6
  BGE r9, main_loop
  STORE r4, r7
  JMP main_loop

pan_up:
  LDI r4, 0x5101
  LOAD r7, r4
  LDI r6, 0x5102
  LOAD r8, r6
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r7, r8
  STORE r4, r7
  JMP main_loop

pan_down:
  LDI r4, 0x5101
  LOAD r7, r4
  LDI r6, 0x5102
  LOAD r8, r6
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r7, r8
  STORE r4, r7
  JMP main_loop

pan_left:
  LDI r4, 0x5100
  LOAD r7, r4
  LDI r6, 0x5102
  LOAD r8, r6
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r7, r8
  STORE r4, r7
  JMP main_loop

pan_right:
  LDI r4, 0x5100
  LOAD r7, r4
  LDI r6, 0x5102
  LOAD r8, r6
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r7, r8
  STORE r4, r7
  JMP main_loop

reset_view:
  LDI r4, 0x5100
  LDI r15, 2048
  NEG r15
  STORE r4, r15
  ADD r4, r11
  LDI r15, 0
  STORE r4, r15
  ADD r4, r11
  LDI r15, 6144
  STORE r4, r15
  ADD r4, r11
  LDI r15, 24
  STORE r4, r15
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r15, 0
  FILL r15
  LDI r4, 0x5100
  LOAD r28, r4
  ADD r4, r11
  LOAD r29, r4
  ADD r4, r11
  LOAD r3, r4
  ADD r4, r11
  LOAD r5, r4
  LDI r13, 0
y_loop:
  LDI r10, 0
  MOV r15, r13
  SHL r15, r17
  ADD r15, r11
  SUB r15, r16
  MUL r15, r3
  SAR r15, r20
  ADD r15, r29
  MOV r2, r15
x_loop:
  MOV r15, r10
  SHL r15, r17
  ADD r15, r11
  SUB r15, r16
  MUL r15, r3
  SAR r15, r20
  ADD r15, r28
  MOV r0, r15
  LDI r14, 0
  LDI r1, 0
  LDI r12, 0
iter:
  MOV r15, r14
  MUL r15, r15
  MOV r6, r15
  MOV r7, r1
  MUL r7, r7
  ADD r6, r7
  CMP r6, r21
  BGE r9, escaped
  CMP r12, r5
  BGE r9, in_set
  SAR r15, r18
  SAR r7, r18
  SUB r15, r7
  ADD r15, r0
  MUL r14, r1
  SAR r14, r19
  ADD r14, r2
  MOV r1, r14
  MOV r14, r15
  ADD r12, r11
  JMP iter
escaped:
  LDI r7, 15
  AND r12, r7
  LDI r6, 0x5000
  ADD r12, r6
  LOAD r4, r12
  JMP draw
in_set:
  LDI r4, 0
draw:
  MOV r15, r10
  SHL r15, r17
  MOV r7, r13
  SHL r7, r17
  RECTF r15, r7, r17, r17, r4
  ADD r10, r11
  CMP r10, r16
  BLT r9, x_loop
  ADD r13, r11
  CMP r13, r16
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
  LDI r4, 0x5100
  LOAD r22, r4       ; r22 = center_re (fixed-point)
  ADD r4, r11
  LOAD r23, r4       ; r23 = center_im (fixed-point)
  ADD r4, r11
  LOAD r24, r4       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r15, 82
  STORE r25, r15
  ADD r25, r11
  LDI r15, 69
  STORE r25, r15
  ADD r25, r11
  LDI r15, 58
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 73
  STORE r25, r15
  ADD r25, r11
  LDI r15, 77
  STORE r25, r15
  ADD r25, r11
  LDI r15, 58
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 90
  STORE r25, r15
  ADD r25, r11
  LDI r15, 58
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r15, 0
  STORE r25, r15

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r15, 91
  STORE r25, r15
  ADD r25, r11
  LDI r15, 43
  STORE r25, r15
  ADD r25, r11
  LDI r15, 47
  STORE r25, r15
  ADD r25, r11
  LDI r15, 45
  STORE r25, r15
  ADD r25, r11
  LDI r15, 93
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 122
  STORE r25, r15
  ADD r25, r11
  LDI r15, 111
  STORE r25, r15
  ADD r25, r11
  LDI r15, 111
  STORE r25, r15
  ADD r25, r11
  LDI r15, 109
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 91
  STORE r25, r15
  ADD r25, r11
  LDI r15, 87
  STORE r25, r15
  ADD r25, r11
  LDI r15, 65
  STORE r25, r15
  ADD r25, r11
  LDI r15, 83
  STORE r25, r15
  ADD r25, r11
  LDI r15, 68
  STORE r25, r15
  ADD r25, r11
  LDI r15, 93
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 112
  STORE r25, r15
  ADD r25, r11
  LDI r15, 97
  STORE r25, r15
  ADD r25, r11
  LDI r15, 110
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 91
  STORE r25, r15
  ADD r25, r11
  LDI r15, 82
  STORE r25, r15
  ADD r25, r11
  LDI r15, 93
  STORE r25, r15
  ADD r25, r11
  LDI r15, 32
  STORE r25, r15
  ADD r25, r11
  LDI r15, 114
  STORE r25, r15
  ADD r25, r11
  LDI r15, 101
  STORE r25, r15
  ADD r25, r11
  LDI r15, 115
  STORE r25, r15
  ADD r25, r11
  LDI r15, 101
  STORE r25, r15
  ADD r25, r11
  LDI r15, 116
  STORE r25, r15
  ADD r25, r11
  ; null terminate
  LDI r15, 0
  STORE r25, r15

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r6, 4
  LDI r8, 4
  LDI r3, 0x5200
  LDI r5, 0xFFFFFF
  LDI r4, 0x000000
  DRAWTEXT r6, r8, r3, r5, r4

  ; Line 2 at (4, 14) in dim gray
  LDI r6, 4
  LDI r8, 14
  LDI r3, 0x5280
  LDI r5, 0x888888
  LDI r4, 0x000000
  DRAWTEXT r6, r8, r3, r5, r4

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r10-r7
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r15, 0x80000000
  MOV r10, r22
  AND r10, r15
  JZ r10, hfs_positive
  ; Negative: write '-', negate value
  LDI r15, 45
  STORE r25, r15
  ADD r25, r11
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r10, r22
  SAR r10, r18        ; r10 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r10 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r15, 46
  STORE r25, r15
  ADD r25, r11
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r10, r22
  LDI r15, 0xFFF
  AND r10, r15         ; r10 = fractional bits (0-4095)
  LDI r15, 1000
  MUL r10, r15         ; r10 = frac * 1000
  LDI r15, 4096
  DIV r10, r15         ; r10 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r15, 100
  MOV r13, r10
  DIV r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  ; Tens digit
  MOV r13, r10
  LDI r15, 100
  MOD r13, r15
  LDI r15, 10
  DIV r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  ; Units digit
  MOV r13, r10
  LDI r15, 10
  MOD r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r10, r22
  SAR r10, r18        ; integer part
  CALL hud_write_u32
  LDI r15, 46
  STORE r25, r15
  ADD r25, r11
  MOV r10, r22
  LDI r15, 0xFFF
  AND r10, r15
  LDI r15, 1000
  MUL r10, r15
  LDI r15, 4096
  DIV r10, r15
  ; Hundreds
  LDI r15, 100
  MOV r13, r10
  DIV r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  ; Tens
  MOV r13, r10
  LDI r15, 100
  MOD r13, r15
  LDI r15, 10
  DIV r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  ; Units
  MOV r13, r10
  LDI r15, 10
  MOD r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r25, r13
  ADD r25, r11
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r10 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r10-r7
hud_write_u32:
  PUSH r31
  PUSH r6
  PUSH r8
  PUSH r3
  ; Special case: 0
  LDI r15, 0
  CMP r10, r15
  JNZ r9, hwu_nonzero
  LDI r15, 48
  STORE r25, r15
  ADD r25, r11
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r6, 0x5300    ; temp buffer
  LDI r8, 0         ; digit count
hwu_div_loop:
  LDI r15, 0
  CMP r10, r15
  JZ r9, hwu_flush
  LDI r15, 10
  MOV r13, r10
  MOD r13, r15
  LDI r15, 48
  ADD r13, r15
  STORE r6, r13
  ADD r6, r11
  ADD r8, r11
  LDI r15, 10
  DIV r10, r15
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r6, r11       ; point to last digit written
hwu_copy_loop:
  LDI r15, 0
  CMP r8, r15
  JZ r9, hwu_done
  LOAD r15, r6
  STORE r25, r15
  ADD r25, r11
  SUB r6, r11
  SUB r8, r11
  JMP hwu_copy_loop
hwu_done:
  POP r3
  POP r8
  POP r6
  POP r31
  RET
