; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r4, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r3, 0x5000
LDI r2, 0x000066
STORE r3, r2
ADD r3, r4
LDI r2, 0x0000CC
STORE r3, r2
ADD r3, r4
LDI r2, 0x0044FF
STORE r3, r2
ADD r3, r4
LDI r2, 0x00AAFF
STORE r3, r2
ADD r3, r4
LDI r2, 0x00FFCC
STORE r3, r2
ADD r3, r4
LDI r2, 0x00FF44
STORE r3, r2
ADD r3, r4
LDI r2, 0x44FF00
STORE r3, r2
ADD r3, r4
LDI r2, 0xAAFF00
STORE r3, r2
ADD r3, r4
LDI r2, 0xFFEE00
STORE r3, r2
ADD r3, r4
LDI r2, 0xFFAA00
STORE r3, r2
ADD r3, r4
LDI r2, 0xFF4400
STORE r3, r2
ADD r3, r4
LDI r2, 0xFF0000
STORE r3, r2
ADD r3, r4
LDI r2, 0xDD0044
STORE r3, r2
ADD r3, r4
LDI r2, 0xAA00AA
STORE r3, r2
ADD r3, r4
LDI r2, 0x550077
STORE r3, r2
ADD r3, r4
LDI r2, 0x220044
STORE r3, r2

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r3, 0x5100
LDI r2, 2048
NEG r2
STORE r3, r2
ADD r3, r4
; center_im = 0.0
LDI r2, 0
STORE r3, r2
ADD r3, r4
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r2, 6144
STORE r3, r2
ADD r3, r4
; max_iter = 24
LDI r2, 24
STORE r3, r2

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r11
  LDI r0, 43
  CMP r11, r0
  JZ r10, zoom_in
  LDI r0, 45
  CMP r11, r0
  JZ r10, zoom_out
  LDI r0, 87
  CMP r11, r0
  JZ r10, pan_up
  LDI r0, 83
  CMP r11, r0
  JZ r10, pan_down
  LDI r0, 65
  CMP r11, r0
  JZ r10, pan_left
  LDI r0, 68
  CMP r11, r0
  JZ r10, pan_right
  LDI r0, 82
  CMP r11, r0
  JZ r10, reset_view
  LDI r0, 81
  CMP r11, r0
  JZ r10, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r3, 0x5102
  LOAD r0, r3
  SAR r0, r17
  STORE r3, r0
  JMP main_loop

zoom_out:
  LDI r3, 0x5102
  LOAD r0, r3
  SHL r0, r17
  LDI r11, 24576
  CMP r0, r11
  BGE r10, main_loop
  STORE r3, r0
  JMP main_loop

pan_up:
  LDI r3, 0x5101
  LOAD r0, r3
  LDI r11, 0x5102
  LOAD r13, r11
  SAR r13, r17
  SAR r13, r17
  SAR r13, r17
  SUB r0, r13
  STORE r3, r0
  JMP main_loop

pan_down:
  LDI r3, 0x5101
  LOAD r0, r3
  LDI r11, 0x5102
  LOAD r13, r11
  SAR r13, r17
  SAR r13, r17
  SAR r13, r17
  ADD r0, r13
  STORE r3, r0
  JMP main_loop

pan_left:
  LDI r3, 0x5100
  LOAD r0, r3
  LDI r11, 0x5102
  LOAD r13, r11
  SAR r13, r17
  SAR r13, r17
  SAR r13, r17
  SUB r0, r13
  STORE r3, r0
  JMP main_loop

pan_right:
  LDI r3, 0x5100
  LOAD r0, r3
  LDI r11, 0x5102
  LOAD r13, r11
  SAR r13, r17
  SAR r13, r17
  SAR r13, r17
  ADD r0, r13
  STORE r3, r0
  JMP main_loop

reset_view:
  LDI r3, 0x5100
  LDI r2, 2048
  NEG r2
  STORE r3, r2
  ADD r3, r4
  LDI r2, 0
  STORE r3, r2
  ADD r3, r4
  LDI r2, 6144
  STORE r3, r2
  ADD r3, r4
  LDI r2, 24
  STORE r3, r2
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r2, 0
  FILL r2
  LDI r3, 0x5100
  LOAD r28, r3
  ADD r3, r4
  LOAD r29, r3
  ADD r3, r4
  LOAD r8, r3
  ADD r3, r4
  LOAD r6, r3
  LDI r5, 0
y_loop:
  LDI r14, 0
  MOV r2, r5
  SHL r2, r17
  ADD r2, r4
  SUB r2, r16
  MUL r2, r8
  SAR r2, r20
  ADD r2, r29
  MOV r15, r2
x_loop:
  MOV r2, r14
  SHL r2, r17
  ADD r2, r4
  SUB r2, r16
  MUL r2, r8
  SAR r2, r20
  ADD r2, r28
  MOV r1, r2
  LDI r7, 0
  LDI r9, 0
  LDI r12, 0
iter:
  MOV r2, r7
  MUL r2, r2
  MOV r11, r2
  MOV r0, r9
  MUL r0, r0
  ADD r11, r0
  CMP r11, r21
  BGE r10, escaped
  CMP r12, r6
  BGE r10, in_set
  SAR r2, r18
  SAR r0, r18
  SUB r2, r0
  ADD r2, r1
  MUL r7, r9
  SAR r7, r19
  ADD r7, r15
  MOV r9, r7
  MOV r7, r2
  ADD r12, r4
  JMP iter
escaped:
  LDI r0, 15
  AND r12, r0
  LDI r11, 0x5000
  ADD r12, r11
  LOAD r3, r12
  JMP draw
in_set:
  LDI r3, 0
draw:
  MOV r2, r14
  SHL r2, r17
  MOV r0, r5
  SHL r0, r17
  RECTF r2, r0, r17, r17, r3
  ADD r14, r4
  CMP r14, r16
  BLT r10, x_loop
  ADD r5, r4
  CMP r5, r16
  BLT r10, y_loop
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
  LDI r3, 0x5100
  LOAD r22, r3       ; r22 = center_re (fixed-point)
  ADD r3, r4
  LOAD r23, r3       ; r23 = center_im (fixed-point)
  ADD r3, r4
  LOAD r24, r3       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r2, 82
  STORE r25, r2
  ADD r25, r4
  LDI r2, 69
  STORE r25, r2
  ADD r25, r4
  LDI r2, 58
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 73
  STORE r25, r2
  ADD r25, r4
  LDI r2, 77
  STORE r25, r2
  ADD r25, r4
  LDI r2, 58
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 90
  STORE r25, r2
  ADD r25, r4
  LDI r2, 58
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r2, 0
  STORE r25, r2

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r2, 91
  STORE r25, r2
  ADD r25, r4
  LDI r2, 43
  STORE r25, r2
  ADD r25, r4
  LDI r2, 47
  STORE r25, r2
  ADD r25, r4
  LDI r2, 45
  STORE r25, r2
  ADD r25, r4
  LDI r2, 93
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 122
  STORE r25, r2
  ADD r25, r4
  LDI r2, 111
  STORE r25, r2
  ADD r25, r4
  LDI r2, 111
  STORE r25, r2
  ADD r25, r4
  LDI r2, 109
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 91
  STORE r25, r2
  ADD r25, r4
  LDI r2, 87
  STORE r25, r2
  ADD r25, r4
  LDI r2, 65
  STORE r25, r2
  ADD r25, r4
  LDI r2, 83
  STORE r25, r2
  ADD r25, r4
  LDI r2, 68
  STORE r25, r2
  ADD r25, r4
  LDI r2, 93
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 112
  STORE r25, r2
  ADD r25, r4
  LDI r2, 97
  STORE r25, r2
  ADD r25, r4
  LDI r2, 110
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 91
  STORE r25, r2
  ADD r25, r4
  LDI r2, 82
  STORE r25, r2
  ADD r25, r4
  LDI r2, 93
  STORE r25, r2
  ADD r25, r4
  LDI r2, 32
  STORE r25, r2
  ADD r25, r4
  LDI r2, 114
  STORE r25, r2
  ADD r25, r4
  LDI r2, 101
  STORE r25, r2
  ADD r25, r4
  LDI r2, 115
  STORE r25, r2
  ADD r25, r4
  LDI r2, 101
  STORE r25, r2
  ADD r25, r4
  LDI r2, 116
  STORE r25, r2
  ADD r25, r4
  ; null terminate
  LDI r2, 0
  STORE r25, r2

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r11, 4
  LDI r13, 4
  LDI r8, 0x5200
  LDI r6, 0xFFFFFF
  LDI r3, 0x000000
  DRAWTEXT r11, r13, r8, r6, r3

  ; Line 2 at (4, 14) in dim gray
  LDI r11, 4
  LDI r13, 14
  LDI r8, 0x5280
  LDI r6, 0x888888
  LDI r3, 0x000000
  DRAWTEXT r11, r13, r8, r6, r3

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r14-r0
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r2, 0x80000000
  MOV r14, r22
  AND r14, r2
  JZ r14, hfs_positive
  ; Negative: write '-', negate value
  LDI r2, 45
  STORE r25, r2
  ADD r25, r4
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r14, r22
  SAR r14, r18        ; r14 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r14 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r2, 46
  STORE r25, r2
  ADD r25, r4
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r14, r22
  LDI r2, 0xFFF
  AND r14, r2         ; r14 = fractional bits (0-4095)
  LDI r2, 1000
  MUL r14, r2         ; r14 = frac * 1000
  LDI r2, 4096
  DIV r14, r2         ; r14 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r2, 100
  MOV r5, r14
  DIV r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  ; Tens digit
  MOV r5, r14
  LDI r2, 100
  MOD r5, r2
  LDI r2, 10
  DIV r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  ; Units digit
  MOV r5, r14
  LDI r2, 10
  MOD r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r14, r22
  SAR r14, r18        ; integer part
  CALL hud_write_u32
  LDI r2, 46
  STORE r25, r2
  ADD r25, r4
  MOV r14, r22
  LDI r2, 0xFFF
  AND r14, r2
  LDI r2, 1000
  MUL r14, r2
  LDI r2, 4096
  DIV r14, r2
  ; Hundreds
  LDI r2, 100
  MOV r5, r14
  DIV r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  ; Tens
  MOV r5, r14
  LDI r2, 100
  MOD r5, r2
  LDI r2, 10
  DIV r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  ; Units
  MOV r5, r14
  LDI r2, 10
  MOD r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r25, r5
  ADD r25, r4
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r14 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r14-r0
hud_write_u32:
  PUSH r31
  PUSH r11
  PUSH r13
  PUSH r8
  ; Special case: 0
  LDI r2, 0
  CMP r14, r2
  JNZ r10, hwu_nonzero
  LDI r2, 48
  STORE r25, r2
  ADD r25, r4
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r11, 0x5300    ; temp buffer
  LDI r13, 0         ; digit count
hwu_div_loop:
  LDI r2, 0
  CMP r14, r2
  JZ r10, hwu_flush
  LDI r2, 10
  MOV r5, r14
  MOD r5, r2
  LDI r2, 48
  ADD r5, r2
  STORE r11, r5
  ADD r11, r4
  ADD r13, r4
  LDI r2, 10
  DIV r14, r2
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r11, r4       ; point to last digit written
hwu_copy_loop:
  LDI r2, 0
  CMP r13, r2
  JZ r10, hwu_done
  LOAD r2, r11
  STORE r25, r2
  ADD r25, r4
  SUB r11, r4
  SUB r13, r4
  JMP hwu_copy_loop
hwu_done:
  POP r8
  POP r13
  POP r11
  POP r31
  RET
