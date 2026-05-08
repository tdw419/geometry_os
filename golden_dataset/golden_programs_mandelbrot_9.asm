; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r6, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r1, 0x5000
LDI r9, 0x000066
STORE r1, r9
ADD r1, r6
LDI r9, 0x0000CC
STORE r1, r9
ADD r1, r6
LDI r9, 0x0044FF
STORE r1, r9
ADD r1, r6
LDI r9, 0x00AAFF
STORE r1, r9
ADD r1, r6
LDI r9, 0x00FFCC
STORE r1, r9
ADD r1, r6
LDI r9, 0x00FF44
STORE r1, r9
ADD r1, r6
LDI r9, 0x44FF00
STORE r1, r9
ADD r1, r6
LDI r9, 0xAAFF00
STORE r1, r9
ADD r1, r6
LDI r9, 0xFFEE00
STORE r1, r9
ADD r1, r6
LDI r9, 0xFFAA00
STORE r1, r9
ADD r1, r6
LDI r9, 0xFF4400
STORE r1, r9
ADD r1, r6
LDI r9, 0xFF0000
STORE r1, r9
ADD r1, r6
LDI r9, 0xDD0044
STORE r1, r9
ADD r1, r6
LDI r9, 0xAA00AA
STORE r1, r9
ADD r1, r6
LDI r9, 0x550077
STORE r1, r9
ADD r1, r6
LDI r9, 0x220044
STORE r1, r9

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r1, 0x5100
LDI r9, 2048
NEG r9
STORE r1, r9
ADD r1, r6
; center_im = 0.0
LDI r9, 0
STORE r1, r9
ADD r1, r6
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r9, 6144
STORE r1, r9
ADD r1, r6
; max_iter = 24
LDI r9, 24
STORE r1, r9

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r11
  LDI r2, 43
  CMP r11, r2
  JZ r5, zoom_in
  LDI r2, 45
  CMP r11, r2
  JZ r5, zoom_out
  LDI r2, 87
  CMP r11, r2
  JZ r5, pan_up
  LDI r2, 83
  CMP r11, r2
  JZ r5, pan_down
  LDI r2, 65
  CMP r11, r2
  JZ r5, pan_left
  LDI r2, 68
  CMP r11, r2
  JZ r5, pan_right
  LDI r2, 82
  CMP r11, r2
  JZ r5, reset_view
  LDI r2, 81
  CMP r11, r2
  JZ r5, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r1, 0x5102
  LOAD r2, r1
  SAR r2, r17
  STORE r1, r2
  JMP main_loop

zoom_out:
  LDI r1, 0x5102
  LOAD r2, r1
  SHL r2, r17
  LDI r11, 24576
  CMP r2, r11
  BGE r5, main_loop
  STORE r1, r2
  JMP main_loop

pan_up:
  LDI r1, 0x5101
  LOAD r2, r1
  LDI r11, 0x5102
  LOAD r8, r11
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r2, r8
  STORE r1, r2
  JMP main_loop

pan_down:
  LDI r1, 0x5101
  LOAD r2, r1
  LDI r11, 0x5102
  LOAD r8, r11
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r2, r8
  STORE r1, r2
  JMP main_loop

pan_left:
  LDI r1, 0x5100
  LOAD r2, r1
  LDI r11, 0x5102
  LOAD r8, r11
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r2, r8
  STORE r1, r2
  JMP main_loop

pan_right:
  LDI r1, 0x5100
  LOAD r2, r1
  LDI r11, 0x5102
  LOAD r8, r11
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r2, r8
  STORE r1, r2
  JMP main_loop

reset_view:
  LDI r1, 0x5100
  LDI r9, 2048
  NEG r9
  STORE r1, r9
  ADD r1, r6
  LDI r9, 0
  STORE r1, r9
  ADD r1, r6
  LDI r9, 6144
  STORE r1, r9
  ADD r1, r6
  LDI r9, 24
  STORE r1, r9
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r9, 0
  FILL r9
  LDI r1, 0x5100
  LOAD r28, r1
  ADD r1, r6
  LOAD r29, r1
  ADD r1, r6
  LOAD r3, r1
  ADD r1, r6
  LOAD r10, r1
  LDI r4, 0
y_loop:
  LDI r15, 0
  MOV r9, r4
  SHL r9, r17
  ADD r9, r6
  SUB r9, r16
  MUL r9, r3
  SAR r9, r20
  ADD r9, r29
  MOV r14, r9
x_loop:
  MOV r9, r15
  SHL r9, r17
  ADD r9, r6
  SUB r9, r16
  MUL r9, r3
  SAR r9, r20
  ADD r9, r28
  MOV r13, r9
  LDI r0, 0
  LDI r12, 0
  LDI r7, 0
iter:
  MOV r9, r0
  MUL r9, r9
  MOV r11, r9
  MOV r2, r12
  MUL r2, r2
  ADD r11, r2
  CMP r11, r21
  BGE r5, escaped
  CMP r7, r10
  BGE r5, in_set
  SAR r9, r18
  SAR r2, r18
  SUB r9, r2
  ADD r9, r13
  MUL r0, r12
  SAR r0, r19
  ADD r0, r14
  MOV r12, r0
  MOV r0, r9
  ADD r7, r6
  JMP iter
escaped:
  LDI r2, 15
  AND r7, r2
  LDI r11, 0x5000
  ADD r7, r11
  LOAD r1, r7
  JMP draw
in_set:
  LDI r1, 0
draw:
  MOV r9, r15
  SHL r9, r17
  MOV r2, r4
  SHL r2, r17
  RECTF r9, r2, r17, r17, r1
  ADD r15, r6
  CMP r15, r16
  BLT r5, x_loop
  ADD r4, r6
  CMP r4, r16
  BLT r5, y_loop
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
  LDI r1, 0x5100
  LOAD r22, r1       ; r22 = center_re (fixed-point)
  ADD r1, r6
  LOAD r23, r1       ; r23 = center_im (fixed-point)
  ADD r1, r6
  LOAD r24, r1       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r9, 82
  STORE r25, r9
  ADD r25, r6
  LDI r9, 69
  STORE r25, r9
  ADD r25, r6
  LDI r9, 58
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 73
  STORE r25, r9
  ADD r25, r6
  LDI r9, 77
  STORE r25, r9
  ADD r25, r6
  LDI r9, 58
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 90
  STORE r25, r9
  ADD r25, r6
  LDI r9, 58
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r9, 0
  STORE r25, r9

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r9, 91
  STORE r25, r9
  ADD r25, r6
  LDI r9, 43
  STORE r25, r9
  ADD r25, r6
  LDI r9, 47
  STORE r25, r9
  ADD r25, r6
  LDI r9, 45
  STORE r25, r9
  ADD r25, r6
  LDI r9, 93
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 122
  STORE r25, r9
  ADD r25, r6
  LDI r9, 111
  STORE r25, r9
  ADD r25, r6
  LDI r9, 111
  STORE r25, r9
  ADD r25, r6
  LDI r9, 109
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 91
  STORE r25, r9
  ADD r25, r6
  LDI r9, 87
  STORE r25, r9
  ADD r25, r6
  LDI r9, 65
  STORE r25, r9
  ADD r25, r6
  LDI r9, 83
  STORE r25, r9
  ADD r25, r6
  LDI r9, 68
  STORE r25, r9
  ADD r25, r6
  LDI r9, 93
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 112
  STORE r25, r9
  ADD r25, r6
  LDI r9, 97
  STORE r25, r9
  ADD r25, r6
  LDI r9, 110
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 91
  STORE r25, r9
  ADD r25, r6
  LDI r9, 82
  STORE r25, r9
  ADD r25, r6
  LDI r9, 93
  STORE r25, r9
  ADD r25, r6
  LDI r9, 32
  STORE r25, r9
  ADD r25, r6
  LDI r9, 114
  STORE r25, r9
  ADD r25, r6
  LDI r9, 101
  STORE r25, r9
  ADD r25, r6
  LDI r9, 115
  STORE r25, r9
  ADD r25, r6
  LDI r9, 101
  STORE r25, r9
  ADD r25, r6
  LDI r9, 116
  STORE r25, r9
  ADD r25, r6
  ; null terminate
  LDI r9, 0
  STORE r25, r9

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r11, 4
  LDI r8, 4
  LDI r3, 0x5200
  LDI r10, 0xFFFFFF
  LDI r1, 0x000000
  DRAWTEXT r11, r8, r3, r10, r1

  ; Line 2 at (4, 14) in dim gray
  LDI r11, 4
  LDI r8, 14
  LDI r3, 0x5280
  LDI r10, 0x888888
  LDI r1, 0x000000
  DRAWTEXT r11, r8, r3, r10, r1

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r15-r2
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r9, 0x80000000
  MOV r15, r22
  AND r15, r9
  JZ r15, hfs_positive
  ; Negative: write '-', negate value
  LDI r9, 45
  STORE r25, r9
  ADD r25, r6
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r15, r22
  SAR r15, r18        ; r15 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r15 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r9, 46
  STORE r25, r9
  ADD r25, r6
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r15, r22
  LDI r9, 0xFFF
  AND r15, r9         ; r15 = fractional bits (0-4095)
  LDI r9, 1000
  MUL r15, r9         ; r15 = frac * 1000
  LDI r9, 4096
  DIV r15, r9         ; r15 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r9, 100
  MOV r4, r15
  DIV r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  ; Tens digit
  MOV r4, r15
  LDI r9, 100
  MOD r4, r9
  LDI r9, 10
  DIV r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  ; Units digit
  MOV r4, r15
  LDI r9, 10
  MOD r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r15, r22
  SAR r15, r18        ; integer part
  CALL hud_write_u32
  LDI r9, 46
  STORE r25, r9
  ADD r25, r6
  MOV r15, r22
  LDI r9, 0xFFF
  AND r15, r9
  LDI r9, 1000
  MUL r15, r9
  LDI r9, 4096
  DIV r15, r9
  ; Hundreds
  LDI r9, 100
  MOV r4, r15
  DIV r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  ; Tens
  MOV r4, r15
  LDI r9, 100
  MOD r4, r9
  LDI r9, 10
  DIV r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  ; Units
  MOV r4, r15
  LDI r9, 10
  MOD r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r25, r4
  ADD r25, r6
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r15 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r15-r2
hud_write_u32:
  PUSH r31
  PUSH r11
  PUSH r8
  PUSH r3
  ; Special case: 0
  LDI r9, 0
  CMP r15, r9
  JNZ r5, hwu_nonzero
  LDI r9, 48
  STORE r25, r9
  ADD r25, r6
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r11, 0x5300    ; temp buffer
  LDI r8, 0         ; digit count
hwu_div_loop:
  LDI r9, 0
  CMP r15, r9
  JZ r5, hwu_flush
  LDI r9, 10
  MOV r4, r15
  MOD r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r11, r4
  ADD r11, r6
  ADD r8, r6
  LDI r9, 10
  DIV r15, r9
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r11, r6       ; point to last digit written
hwu_copy_loop:
  LDI r9, 0
  CMP r8, r9
  JZ r5, hwu_done
  LOAD r9, r11
  STORE r25, r9
  ADD r25, r6
  SUB r11, r6
  SUB r8, r6
  JMP hwu_copy_loop
hwu_done:
  POP r3
  POP r8
  POP r11
  POP r31
  RET
