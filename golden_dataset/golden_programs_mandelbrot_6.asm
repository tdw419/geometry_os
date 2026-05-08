; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r10, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r3, 0x5000
LDI r5, 0x000066
STORE r3, r5
ADD r3, r10
LDI r5, 0x0000CC
STORE r3, r5
ADD r3, r10
LDI r5, 0x0044FF
STORE r3, r5
ADD r3, r10
LDI r5, 0x00AAFF
STORE r3, r5
ADD r3, r10
LDI r5, 0x00FFCC
STORE r3, r5
ADD r3, r10
LDI r5, 0x00FF44
STORE r3, r5
ADD r3, r10
LDI r5, 0x44FF00
STORE r3, r5
ADD r3, r10
LDI r5, 0xAAFF00
STORE r3, r5
ADD r3, r10
LDI r5, 0xFFEE00
STORE r3, r5
ADD r3, r10
LDI r5, 0xFFAA00
STORE r3, r5
ADD r3, r10
LDI r5, 0xFF4400
STORE r3, r5
ADD r3, r10
LDI r5, 0xFF0000
STORE r3, r5
ADD r3, r10
LDI r5, 0xDD0044
STORE r3, r5
ADD r3, r10
LDI r5, 0xAA00AA
STORE r3, r5
ADD r3, r10
LDI r5, 0x550077
STORE r3, r5
ADD r3, r10
LDI r5, 0x220044
STORE r3, r5

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r3, 0x5100
LDI r5, 2048
NEG r5
STORE r3, r5
ADD r3, r10
; center_im = 0.0
LDI r5, 0
STORE r3, r5
ADD r3, r10
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r5, 6144
STORE r3, r5
ADD r3, r10
; max_iter = 24
LDI r5, 24
STORE r3, r5

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r13
  LDI r8, 43
  CMP r13, r8
  JZ r2, zoom_in
  LDI r8, 45
  CMP r13, r8
  JZ r2, zoom_out
  LDI r8, 87
  CMP r13, r8
  JZ r2, pan_up
  LDI r8, 83
  CMP r13, r8
  JZ r2, pan_down
  LDI r8, 65
  CMP r13, r8
  JZ r2, pan_left
  LDI r8, 68
  CMP r13, r8
  JZ r2, pan_right
  LDI r8, 82
  CMP r13, r8
  JZ r2, reset_view
  LDI r8, 81
  CMP r13, r8
  JZ r2, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r3, 0x5102
  LOAD r8, r3
  SAR r8, r17
  STORE r3, r8
  JMP main_loop

zoom_out:
  LDI r3, 0x5102
  LOAD r8, r3
  SHL r8, r17
  LDI r13, 24576
  CMP r8, r13
  BGE r2, main_loop
  STORE r3, r8
  JMP main_loop

pan_up:
  LDI r3, 0x5101
  LOAD r8, r3
  LDI r13, 0x5102
  LOAD r4, r13
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  SUB r8, r4
  STORE r3, r8
  JMP main_loop

pan_down:
  LDI r3, 0x5101
  LOAD r8, r3
  LDI r13, 0x5102
  LOAD r4, r13
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  ADD r8, r4
  STORE r3, r8
  JMP main_loop

pan_left:
  LDI r3, 0x5100
  LOAD r8, r3
  LDI r13, 0x5102
  LOAD r4, r13
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  SUB r8, r4
  STORE r3, r8
  JMP main_loop

pan_right:
  LDI r3, 0x5100
  LOAD r8, r3
  LDI r13, 0x5102
  LOAD r4, r13
  SAR r4, r17
  SAR r4, r17
  SAR r4, r17
  ADD r8, r4
  STORE r3, r8
  JMP main_loop

reset_view:
  LDI r3, 0x5100
  LDI r5, 2048
  NEG r5
  STORE r3, r5
  ADD r3, r10
  LDI r5, 0
  STORE r3, r5
  ADD r3, r10
  LDI r5, 6144
  STORE r3, r5
  ADD r3, r10
  LDI r5, 24
  STORE r3, r5
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r5, 0
  FILL r5
  LDI r3, 0x5100
  LOAD r28, r3
  ADD r3, r10
  LOAD r29, r3
  ADD r3, r10
  LOAD r7, r3
  ADD r3, r10
  LOAD r9, r3
  LDI r12, 0
y_loop:
  LDI r14, 0
  MOV r5, r12
  SHL r5, r17
  ADD r5, r10
  SUB r5, r16
  MUL r5, r7
  SAR r5, r20
  ADD r5, r29
  MOV r6, r5
x_loop:
  MOV r5, r14
  SHL r5, r17
  ADD r5, r10
  SUB r5, r16
  MUL r5, r7
  SAR r5, r20
  ADD r5, r28
  MOV r0, r5
  LDI r1, 0
  LDI r15, 0
  LDI r11, 0
iter:
  MOV r5, r1
  MUL r5, r5
  MOV r13, r5
  MOV r8, r15
  MUL r8, r8
  ADD r13, r8
  CMP r13, r21
  BGE r2, escaped
  CMP r11, r9
  BGE r2, in_set
  SAR r5, r18
  SAR r8, r18
  SUB r5, r8
  ADD r5, r0
  MUL r1, r15
  SAR r1, r19
  ADD r1, r6
  MOV r15, r1
  MOV r1, r5
  ADD r11, r10
  JMP iter
escaped:
  LDI r8, 15
  AND r11, r8
  LDI r13, 0x5000
  ADD r11, r13
  LOAD r3, r11
  JMP draw
in_set:
  LDI r3, 0
draw:
  MOV r5, r14
  SHL r5, r17
  MOV r8, r12
  SHL r8, r17
  RECTF r5, r8, r17, r17, r3
  ADD r14, r10
  CMP r14, r16
  BLT r2, x_loop
  ADD r12, r10
  CMP r12, r16
  BLT r2, y_loop
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
  ADD r3, r10
  LOAD r23, r3       ; r23 = center_im (fixed-point)
  ADD r3, r10
  LOAD r24, r3       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r5, 82
  STORE r25, r5
  ADD r25, r10
  LDI r5, 69
  STORE r25, r5
  ADD r25, r10
  LDI r5, 58
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 73
  STORE r25, r5
  ADD r25, r10
  LDI r5, 77
  STORE r25, r5
  ADD r25, r10
  LDI r5, 58
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 90
  STORE r25, r5
  ADD r25, r10
  LDI r5, 58
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r5, 0
  STORE r25, r5

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r5, 91
  STORE r25, r5
  ADD r25, r10
  LDI r5, 43
  STORE r25, r5
  ADD r25, r10
  LDI r5, 47
  STORE r25, r5
  ADD r25, r10
  LDI r5, 45
  STORE r25, r5
  ADD r25, r10
  LDI r5, 93
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 122
  STORE r25, r5
  ADD r25, r10
  LDI r5, 111
  STORE r25, r5
  ADD r25, r10
  LDI r5, 111
  STORE r25, r5
  ADD r25, r10
  LDI r5, 109
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 91
  STORE r25, r5
  ADD r25, r10
  LDI r5, 87
  STORE r25, r5
  ADD r25, r10
  LDI r5, 65
  STORE r25, r5
  ADD r25, r10
  LDI r5, 83
  STORE r25, r5
  ADD r25, r10
  LDI r5, 68
  STORE r25, r5
  ADD r25, r10
  LDI r5, 93
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 112
  STORE r25, r5
  ADD r25, r10
  LDI r5, 97
  STORE r25, r5
  ADD r25, r10
  LDI r5, 110
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 91
  STORE r25, r5
  ADD r25, r10
  LDI r5, 82
  STORE r25, r5
  ADD r25, r10
  LDI r5, 93
  STORE r25, r5
  ADD r25, r10
  LDI r5, 32
  STORE r25, r5
  ADD r25, r10
  LDI r5, 114
  STORE r25, r5
  ADD r25, r10
  LDI r5, 101
  STORE r25, r5
  ADD r25, r10
  LDI r5, 115
  STORE r25, r5
  ADD r25, r10
  LDI r5, 101
  STORE r25, r5
  ADD r25, r10
  LDI r5, 116
  STORE r25, r5
  ADD r25, r10
  ; null terminate
  LDI r5, 0
  STORE r25, r5

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r13, 4
  LDI r4, 4
  LDI r7, 0x5200
  LDI r9, 0xFFFFFF
  LDI r3, 0x000000
  DRAWTEXT r13, r4, r7, r9, r3

  ; Line 2 at (4, 14) in dim gray
  LDI r13, 4
  LDI r4, 14
  LDI r7, 0x5280
  LDI r9, 0x888888
  LDI r3, 0x000000
  DRAWTEXT r13, r4, r7, r9, r3

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r14-r8
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r5, 0x80000000
  MOV r14, r22
  AND r14, r5
  JZ r14, hfs_positive
  ; Negative: write '-', negate value
  LDI r5, 45
  STORE r25, r5
  ADD r25, r10
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r14, r22
  SAR r14, r18        ; r14 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r14 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r5, 46
  STORE r25, r5
  ADD r25, r10
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r14, r22
  LDI r5, 0xFFF
  AND r14, r5         ; r14 = fractional bits (0-4095)
  LDI r5, 1000
  MUL r14, r5         ; r14 = frac * 1000
  LDI r5, 4096
  DIV r14, r5         ; r14 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r5, 100
  MOV r12, r14
  DIV r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  ; Tens digit
  MOV r12, r14
  LDI r5, 100
  MOD r12, r5
  LDI r5, 10
  DIV r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  ; Units digit
  MOV r12, r14
  LDI r5, 10
  MOD r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r14, r22
  SAR r14, r18        ; integer part
  CALL hud_write_u32
  LDI r5, 46
  STORE r25, r5
  ADD r25, r10
  MOV r14, r22
  LDI r5, 0xFFF
  AND r14, r5
  LDI r5, 1000
  MUL r14, r5
  LDI r5, 4096
  DIV r14, r5
  ; Hundreds
  LDI r5, 100
  MOV r12, r14
  DIV r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  ; Tens
  MOV r12, r14
  LDI r5, 100
  MOD r12, r5
  LDI r5, 10
  DIV r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  ; Units
  MOV r12, r14
  LDI r5, 10
  MOD r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r25, r12
  ADD r25, r10
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r14 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r14-r8
hud_write_u32:
  PUSH r31
  PUSH r13
  PUSH r4
  PUSH r7
  ; Special case: 0
  LDI r5, 0
  CMP r14, r5
  JNZ r2, hwu_nonzero
  LDI r5, 48
  STORE r25, r5
  ADD r25, r10
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r13, 0x5300    ; temp buffer
  LDI r4, 0         ; digit count
hwu_div_loop:
  LDI r5, 0
  CMP r14, r5
  JZ r2, hwu_flush
  LDI r5, 10
  MOV r12, r14
  MOD r12, r5
  LDI r5, 48
  ADD r12, r5
  STORE r13, r12
  ADD r13, r10
  ADD r4, r10
  LDI r5, 10
  DIV r14, r5
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r13, r10       ; point to last digit written
hwu_copy_loop:
  LDI r5, 0
  CMP r4, r5
  JZ r2, hwu_done
  LOAD r5, r13
  STORE r25, r5
  ADD r25, r10
  SUB r13, r10
  SUB r4, r10
  JMP hwu_copy_loop
hwu_done:
  POP r7
  POP r4
  POP r13
  POP r31
  RET
