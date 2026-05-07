; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

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
  CALL draw_hud
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
  LDI r14, 0x5100
  LOAD r22, r14       ; r22 = center_re (fixed-point)
  ADD r14, r15
  LOAD r23, r14       ; r23 = center_im (fixed-point)
  ADD r14, r15
  LOAD r24, r14       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r8, 82
  STORE r25, r8
  ADD r25, r15
  LDI r8, 69
  STORE r25, r8
  ADD r25, r15
  LDI r8, 58
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 73
  STORE r25, r8
  ADD r25, r15
  LDI r8, 77
  STORE r25, r8
  ADD r25, r15
  LDI r8, 58
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 90
  STORE r25, r8
  ADD r25, r15
  LDI r8, 58
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r8, 0
  STORE r25, r8

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r8, 91
  STORE r25, r8
  ADD r25, r15
  LDI r8, 43
  STORE r25, r8
  ADD r25, r15
  LDI r8, 47
  STORE r25, r8
  ADD r25, r15
  LDI r8, 45
  STORE r25, r8
  ADD r25, r15
  LDI r8, 93
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 122
  STORE r25, r8
  ADD r25, r15
  LDI r8, 111
  STORE r25, r8
  ADD r25, r15
  LDI r8, 111
  STORE r25, r8
  ADD r25, r15
  LDI r8, 109
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 91
  STORE r25, r8
  ADD r25, r15
  LDI r8, 87
  STORE r25, r8
  ADD r25, r15
  LDI r8, 65
  STORE r25, r8
  ADD r25, r15
  LDI r8, 83
  STORE r25, r8
  ADD r25, r15
  LDI r8, 68
  STORE r25, r8
  ADD r25, r15
  LDI r8, 93
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 112
  STORE r25, r8
  ADD r25, r15
  LDI r8, 97
  STORE r25, r8
  ADD r25, r15
  LDI r8, 110
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 91
  STORE r25, r8
  ADD r25, r15
  LDI r8, 82
  STORE r25, r8
  ADD r25, r15
  LDI r8, 93
  STORE r25, r8
  ADD r25, r15
  LDI r8, 32
  STORE r25, r8
  ADD r25, r15
  LDI r8, 114
  STORE r25, r8
  ADD r25, r15
  LDI r8, 101
  STORE r25, r8
  ADD r25, r15
  LDI r8, 115
  STORE r25, r8
  ADD r25, r15
  LDI r8, 101
  STORE r25, r8
  ADD r25, r15
  LDI r8, 116
  STORE r25, r8
  ADD r25, r15
  ; null terminate
  LDI r8, 0
  STORE r25, r8

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r10, 4
  LDI r11, 4
  LDI r12, 0x5200
  LDI r13, 0xFFFFFF
  LDI r14, 0x000000
  DRAWTEXT r10, r11, r12, r13, r14

  ; Line 2 at (4, 14) in dim gray
  LDI r10, 4
  LDI r11, 14
  LDI r12, 0x5280
  LDI r13, 0x888888
  LDI r14, 0x000000
  DRAWTEXT r10, r11, r12, r13, r14

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r1-r9
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r8, 0x80000000
  MOV r1, r22
  AND r1, r8
  JZ r1, hfs_positive
  ; Negative: write '-', negate value
  LDI r8, 45
  STORE r25, r8
  ADD r25, r15
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r1, r22
  SAR r1, r18        ; r1 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r1 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r8, 46
  STORE r25, r8
  ADD r25, r15
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r1, r22
  LDI r8, 0xFFF
  AND r1, r8         ; r1 = fractional bits (0-4095)
  LDI r8, 1000
  MUL r1, r8         ; r1 = frac * 1000
  LDI r8, 4096
  DIV r1, r8         ; r1 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r8, 100
  MOV r2, r1
  DIV r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  ; Tens digit
  MOV r2, r1
  LDI r8, 100
  MOD r2, r8
  LDI r8, 10
  DIV r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  ; Units digit
  MOV r2, r1
  LDI r8, 10
  MOD r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r1, r22
  SAR r1, r18        ; integer part
  CALL hud_write_u32
  LDI r8, 46
  STORE r25, r8
  ADD r25, r15
  MOV r1, r22
  LDI r8, 0xFFF
  AND r1, r8
  LDI r8, 1000
  MUL r1, r8
  LDI r8, 4096
  DIV r1, r8
  ; Hundreds
  LDI r8, 100
  MOV r2, r1
  DIV r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  ; Tens
  MOV r2, r1
  LDI r8, 100
  MOD r2, r8
  LDI r8, 10
  DIV r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  ; Units
  MOV r2, r1
  LDI r8, 10
  MOD r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r25, r2
  ADD r25, r15
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r1 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r1-r9
hud_write_u32:
  PUSH r31
  PUSH r10
  PUSH r11
  PUSH r12
  ; Special case: 0
  LDI r8, 0
  CMP r1, r8
  JNZ r0, hwu_nonzero
  LDI r8, 48
  STORE r25, r8
  ADD r25, r15
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r10, 0x5300    ; temp buffer
  LDI r11, 0         ; digit count
hwu_div_loop:
  LDI r8, 0
  CMP r1, r8
  JZ r0, hwu_flush
  LDI r8, 10
  MOV r2, r1
  MOD r2, r8
  LDI r8, 48
  ADD r2, r8
  STORE r10, r2
  ADD r10, r15
  ADD r11, r15
  LDI r8, 10
  DIV r1, r8
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r10, r15       ; point to last digit written
hwu_copy_loop:
  LDI r8, 0
  CMP r11, r8
  JZ r0, hwu_done
  LOAD r8, r10
  STORE r25, r8
  ADD r25, r15
  SUB r10, r15
  SUB r11, r15
  JMP hwu_copy_loop
hwu_done:
  POP r12
  POP r11
  POP r10
  POP r31
  RET
