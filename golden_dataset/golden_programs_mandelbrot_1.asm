; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r13, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r11, 0x5000
LDI r15, 0x000066
STORE r11, r15
ADD r11, r13
LDI r15, 0x0000CC
STORE r11, r15
ADD r11, r13
LDI r15, 0x0044FF
STORE r11, r15
ADD r11, r13
LDI r15, 0x00AAFF
STORE r11, r15
ADD r11, r13
LDI r15, 0x00FFCC
STORE r11, r15
ADD r11, r13
LDI r15, 0x00FF44
STORE r11, r15
ADD r11, r13
LDI r15, 0x44FF00
STORE r11, r15
ADD r11, r13
LDI r15, 0xAAFF00
STORE r11, r15
ADD r11, r13
LDI r15, 0xFFEE00
STORE r11, r15
ADD r11, r13
LDI r15, 0xFFAA00
STORE r11, r15
ADD r11, r13
LDI r15, 0xFF4400
STORE r11, r15
ADD r11, r13
LDI r15, 0xFF0000
STORE r11, r15
ADD r11, r13
LDI r15, 0xDD0044
STORE r11, r15
ADD r11, r13
LDI r15, 0xAA00AA
STORE r11, r15
ADD r11, r13
LDI r15, 0x550077
STORE r11, r15
ADD r11, r13
LDI r15, 0x220044
STORE r11, r15

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r11, 0x5100
LDI r15, 2048
NEG r15
STORE r11, r15
ADD r11, r13
; center_im = 0.0
LDI r15, 0
STORE r11, r15
ADD r11, r13
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r15, 6144
STORE r11, r15
ADD r11, r13
; max_iter = 24
LDI r15, 24
STORE r11, r15

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r7
  LDI r5, 43
  CMP r7, r5
  JZ r6, zoom_in
  LDI r5, 45
  CMP r7, r5
  JZ r6, zoom_out
  LDI r5, 87
  CMP r7, r5
  JZ r6, pan_up
  LDI r5, 83
  CMP r7, r5
  JZ r6, pan_down
  LDI r5, 65
  CMP r7, r5
  JZ r6, pan_left
  LDI r5, 68
  CMP r7, r5
  JZ r6, pan_right
  LDI r5, 82
  CMP r7, r5
  JZ r6, reset_view
  LDI r5, 81
  CMP r7, r5
  JZ r6, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r11, 0x5102
  LOAD r5, r11
  SAR r5, r17
  STORE r11, r5
  JMP main_loop

zoom_out:
  LDI r11, 0x5102
  LOAD r5, r11
  SHL r5, r17
  LDI r7, 24576
  CMP r5, r7
  BGE r6, main_loop
  STORE r11, r5
  JMP main_loop

pan_up:
  LDI r11, 0x5101
  LOAD r5, r11
  LDI r7, 0x5102
  LOAD r14, r7
  SAR r14, r17
  SAR r14, r17
  SAR r14, r17
  SUB r5, r14
  STORE r11, r5
  JMP main_loop

pan_down:
  LDI r11, 0x5101
  LOAD r5, r11
  LDI r7, 0x5102
  LOAD r14, r7
  SAR r14, r17
  SAR r14, r17
  SAR r14, r17
  ADD r5, r14
  STORE r11, r5
  JMP main_loop

pan_left:
  LDI r11, 0x5100
  LOAD r5, r11
  LDI r7, 0x5102
  LOAD r14, r7
  SAR r14, r17
  SAR r14, r17
  SAR r14, r17
  SUB r5, r14
  STORE r11, r5
  JMP main_loop

pan_right:
  LDI r11, 0x5100
  LOAD r5, r11
  LDI r7, 0x5102
  LOAD r14, r7
  SAR r14, r17
  SAR r14, r17
  SAR r14, r17
  ADD r5, r14
  STORE r11, r5
  JMP main_loop

reset_view:
  LDI r11, 0x5100
  LDI r15, 2048
  NEG r15
  STORE r11, r15
  ADD r11, r13
  LDI r15, 0
  STORE r11, r15
  ADD r11, r13
  LDI r15, 6144
  STORE r11, r15
  ADD r11, r13
  LDI r15, 24
  STORE r11, r15
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r15, 0
  FILL r15
  LDI r11, 0x5100
  LOAD r28, r11
  ADD r11, r13
  LOAD r29, r11
  ADD r11, r13
  LOAD r4, r11
  ADD r11, r13
  LOAD r3, r11
  LDI r10, 0
y_loop:
  LDI r12, 0
  MOV r15, r10
  SHL r15, r17
  ADD r15, r13
  SUB r15, r16
  MUL r15, r4
  SAR r15, r20
  ADD r15, r29
  MOV r0, r15
x_loop:
  MOV r15, r12
  SHL r15, r17
  ADD r15, r13
  SUB r15, r16
  MUL r15, r4
  SAR r15, r20
  ADD r15, r28
  MOV r9, r15
  LDI r1, 0
  LDI r2, 0
  LDI r8, 0
iter:
  MOV r15, r1
  MUL r15, r15
  MOV r7, r15
  MOV r5, r2
  MUL r5, r5
  ADD r7, r5
  CMP r7, r21
  BGE r6, escaped
  CMP r8, r3
  BGE r6, in_set
  SAR r15, r18
  SAR r5, r18
  SUB r15, r5
  ADD r15, r9
  MUL r1, r2
  SAR r1, r19
  ADD r1, r0
  MOV r2, r1
  MOV r1, r15
  ADD r8, r13
  JMP iter
escaped:
  LDI r5, 15
  AND r8, r5
  LDI r7, 0x5000
  ADD r8, r7
  LOAD r11, r8
  JMP draw
in_set:
  LDI r11, 0
draw:
  MOV r15, r12
  SHL r15, r17
  MOV r5, r10
  SHL r5, r17
  RECTF r15, r5, r17, r17, r11
  ADD r12, r13
  CMP r12, r16
  BLT r6, x_loop
  ADD r10, r13
  CMP r10, r16
  BLT r6, y_loop
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
  LDI r11, 0x5100
  LOAD r22, r11       ; r22 = center_re (fixed-point)
  ADD r11, r13
  LOAD r23, r11       ; r23 = center_im (fixed-point)
  ADD r11, r13
  LOAD r24, r11       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r15, 82
  STORE r25, r15
  ADD r25, r13
  LDI r15, 69
  STORE r25, r15
  ADD r25, r13
  LDI r15, 58
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 73
  STORE r25, r15
  ADD r25, r13
  LDI r15, 77
  STORE r25, r15
  ADD r25, r13
  LDI r15, 58
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 90
  STORE r25, r15
  ADD r25, r13
  LDI r15, 58
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13

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
  ADD r25, r13
  LDI r15, 43
  STORE r25, r15
  ADD r25, r13
  LDI r15, 47
  STORE r25, r15
  ADD r25, r13
  LDI r15, 45
  STORE r25, r15
  ADD r25, r13
  LDI r15, 93
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 122
  STORE r25, r15
  ADD r25, r13
  LDI r15, 111
  STORE r25, r15
  ADD r25, r13
  LDI r15, 111
  STORE r25, r15
  ADD r25, r13
  LDI r15, 109
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 91
  STORE r25, r15
  ADD r25, r13
  LDI r15, 87
  STORE r25, r15
  ADD r25, r13
  LDI r15, 65
  STORE r25, r15
  ADD r25, r13
  LDI r15, 83
  STORE r25, r15
  ADD r25, r13
  LDI r15, 68
  STORE r25, r15
  ADD r25, r13
  LDI r15, 93
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 112
  STORE r25, r15
  ADD r25, r13
  LDI r15, 97
  STORE r25, r15
  ADD r25, r13
  LDI r15, 110
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 91
  STORE r25, r15
  ADD r25, r13
  LDI r15, 82
  STORE r25, r15
  ADD r25, r13
  LDI r15, 93
  STORE r25, r15
  ADD r25, r13
  LDI r15, 32
  STORE r25, r15
  ADD r25, r13
  LDI r15, 114
  STORE r25, r15
  ADD r25, r13
  LDI r15, 101
  STORE r25, r15
  ADD r25, r13
  LDI r15, 115
  STORE r25, r15
  ADD r25, r13
  LDI r15, 101
  STORE r25, r15
  ADD r25, r13
  LDI r15, 116
  STORE r25, r15
  ADD r25, r13
  ; null terminate
  LDI r15, 0
  STORE r25, r15

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r7, 4
  LDI r14, 4
  LDI r4, 0x5200
  LDI r3, 0xFFFFFF
  LDI r11, 0x000000
  DRAWTEXT r7, r14, r4, r3, r11

  ; Line 2 at (4, 14) in dim gray
  LDI r7, 4
  LDI r14, 14
  LDI r4, 0x5280
  LDI r3, 0x888888
  LDI r11, 0x000000
  DRAWTEXT r7, r14, r4, r3, r11

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r12-r5
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r15, 0x80000000
  MOV r12, r22
  AND r12, r15
  JZ r12, hfs_positive
  ; Negative: write '-', negate value
  LDI r15, 45
  STORE r25, r15
  ADD r25, r13
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r12, r22
  SAR r12, r18        ; r12 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r12 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r15, 46
  STORE r25, r15
  ADD r25, r13
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r12, r22
  LDI r15, 0xFFF
  AND r12, r15         ; r12 = fractional bits (0-4095)
  LDI r15, 1000
  MUL r12, r15         ; r12 = frac * 1000
  LDI r15, 4096
  DIV r12, r15         ; r12 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r15, 100
  MOV r10, r12
  DIV r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  ; Tens digit
  MOV r10, r12
  LDI r15, 100
  MOD r10, r15
  LDI r15, 10
  DIV r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  ; Units digit
  MOV r10, r12
  LDI r15, 10
  MOD r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r12, r22
  SAR r12, r18        ; integer part
  CALL hud_write_u32
  LDI r15, 46
  STORE r25, r15
  ADD r25, r13
  MOV r12, r22
  LDI r15, 0xFFF
  AND r12, r15
  LDI r15, 1000
  MUL r12, r15
  LDI r15, 4096
  DIV r12, r15
  ; Hundreds
  LDI r15, 100
  MOV r10, r12
  DIV r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  ; Tens
  MOV r10, r12
  LDI r15, 100
  MOD r10, r15
  LDI r15, 10
  DIV r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  ; Units
  MOV r10, r12
  LDI r15, 10
  MOD r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r25, r10
  ADD r25, r13
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r12 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r12-r5
hud_write_u32:
  PUSH r31
  PUSH r7
  PUSH r14
  PUSH r4
  ; Special case: 0
  LDI r15, 0
  CMP r12, r15
  JNZ r6, hwu_nonzero
  LDI r15, 48
  STORE r25, r15
  ADD r25, r13
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r7, 0x5300    ; temp buffer
  LDI r14, 0         ; digit count
hwu_div_loop:
  LDI r15, 0
  CMP r12, r15
  JZ r6, hwu_flush
  LDI r15, 10
  MOV r10, r12
  MOD r10, r15
  LDI r15, 48
  ADD r10, r15
  STORE r7, r10
  ADD r7, r13
  ADD r14, r13
  LDI r15, 10
  DIV r12, r15
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r7, r13       ; point to last digit written
hwu_copy_loop:
  LDI r15, 0
  CMP r14, r15
  JZ r6, hwu_done
  LOAD r15, r7
  STORE r25, r15
  ADD r25, r13
  SUB r7, r13
  SUB r14, r13
  JMP hwu_copy_loop
hwu_done:
  POP r4
  POP r14
  POP r7
  POP r31
  RET
