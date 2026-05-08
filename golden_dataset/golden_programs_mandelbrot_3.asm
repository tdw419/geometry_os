; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r9, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r15, 0x5000
LDI r0, 0x000066
STORE r15, r0
ADD r15, r9
LDI r0, 0x0000CC
STORE r15, r0
ADD r15, r9
LDI r0, 0x0044FF
STORE r15, r0
ADD r15, r9
LDI r0, 0x00AAFF
STORE r15, r0
ADD r15, r9
LDI r0, 0x00FFCC
STORE r15, r0
ADD r15, r9
LDI r0, 0x00FF44
STORE r15, r0
ADD r15, r9
LDI r0, 0x44FF00
STORE r15, r0
ADD r15, r9
LDI r0, 0xAAFF00
STORE r15, r0
ADD r15, r9
LDI r0, 0xFFEE00
STORE r15, r0
ADD r15, r9
LDI r0, 0xFFAA00
STORE r15, r0
ADD r15, r9
LDI r0, 0xFF4400
STORE r15, r0
ADD r15, r9
LDI r0, 0xFF0000
STORE r15, r0
ADD r15, r9
LDI r0, 0xDD0044
STORE r15, r0
ADD r15, r9
LDI r0, 0xAA00AA
STORE r15, r0
ADD r15, r9
LDI r0, 0x550077
STORE r15, r0
ADD r15, r9
LDI r0, 0x220044
STORE r15, r0

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r15, 0x5100
LDI r0, 2048
NEG r0
STORE r15, r0
ADD r15, r9
; center_im = 0.0
LDI r0, 0
STORE r15, r0
ADD r15, r9
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r0, 6144
STORE r15, r0
ADD r15, r9
; max_iter = 24
LDI r0, 24
STORE r15, r0

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r10
  LDI r3, 43
  CMP r10, r3
  JZ r2, zoom_in
  LDI r3, 45
  CMP r10, r3
  JZ r2, zoom_out
  LDI r3, 87
  CMP r10, r3
  JZ r2, pan_up
  LDI r3, 83
  CMP r10, r3
  JZ r2, pan_down
  LDI r3, 65
  CMP r10, r3
  JZ r2, pan_left
  LDI r3, 68
  CMP r10, r3
  JZ r2, pan_right
  LDI r3, 82
  CMP r10, r3
  JZ r2, reset_view
  LDI r3, 81
  CMP r10, r3
  JZ r2, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r15, 0x5102
  LOAD r3, r15
  SAR r3, r17
  STORE r15, r3
  JMP main_loop

zoom_out:
  LDI r15, 0x5102
  LOAD r3, r15
  SHL r3, r17
  LDI r10, 24576
  CMP r3, r10
  BGE r2, main_loop
  STORE r15, r3
  JMP main_loop

pan_up:
  LDI r15, 0x5101
  LOAD r3, r15
  LDI r10, 0x5102
  LOAD r5, r10
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  SUB r3, r5
  STORE r15, r3
  JMP main_loop

pan_down:
  LDI r15, 0x5101
  LOAD r3, r15
  LDI r10, 0x5102
  LOAD r5, r10
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  ADD r3, r5
  STORE r15, r3
  JMP main_loop

pan_left:
  LDI r15, 0x5100
  LOAD r3, r15
  LDI r10, 0x5102
  LOAD r5, r10
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  SUB r3, r5
  STORE r15, r3
  JMP main_loop

pan_right:
  LDI r15, 0x5100
  LOAD r3, r15
  LDI r10, 0x5102
  LOAD r5, r10
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  ADD r3, r5
  STORE r15, r3
  JMP main_loop

reset_view:
  LDI r15, 0x5100
  LDI r0, 2048
  NEG r0
  STORE r15, r0
  ADD r15, r9
  LDI r0, 0
  STORE r15, r0
  ADD r15, r9
  LDI r0, 6144
  STORE r15, r0
  ADD r15, r9
  LDI r0, 24
  STORE r15, r0
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r0, 0
  FILL r0
  LDI r15, 0x5100
  LOAD r28, r15
  ADD r15, r9
  LOAD r29, r15
  ADD r15, r9
  LOAD r7, r15
  ADD r15, r9
  LOAD r14, r15
  LDI r12, 0
y_loop:
  LDI r13, 0
  MOV r0, r12
  SHL r0, r17
  ADD r0, r9
  SUB r0, r16
  MUL r0, r7
  SAR r0, r20
  ADD r0, r29
  MOV r1, r0
x_loop:
  MOV r0, r13
  SHL r0, r17
  ADD r0, r9
  SUB r0, r16
  MUL r0, r7
  SAR r0, r20
  ADD r0, r28
  MOV r6, r0
  LDI r8, 0
  LDI r11, 0
  LDI r4, 0
iter:
  MOV r0, r8
  MUL r0, r0
  MOV r10, r0
  MOV r3, r11
  MUL r3, r3
  ADD r10, r3
  CMP r10, r21
  BGE r2, escaped
  CMP r4, r14
  BGE r2, in_set
  SAR r0, r18
  SAR r3, r18
  SUB r0, r3
  ADD r0, r6
  MUL r8, r11
  SAR r8, r19
  ADD r8, r1
  MOV r11, r8
  MOV r8, r0
  ADD r4, r9
  JMP iter
escaped:
  LDI r3, 15
  AND r4, r3
  LDI r10, 0x5000
  ADD r4, r10
  LOAD r15, r4
  JMP draw
in_set:
  LDI r15, 0
draw:
  MOV r0, r13
  SHL r0, r17
  MOV r3, r12
  SHL r3, r17
  RECTF r0, r3, r17, r17, r15
  ADD r13, r9
  CMP r13, r16
  BLT r2, x_loop
  ADD r12, r9
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
  LDI r15, 0x5100
  LOAD r22, r15       ; r22 = center_re (fixed-point)
  ADD r15, r9
  LOAD r23, r15       ; r23 = center_im (fixed-point)
  ADD r15, r9
  LOAD r24, r15       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r0, 82
  STORE r25, r0
  ADD r25, r9
  LDI r0, 69
  STORE r25, r0
  ADD r25, r9
  LDI r0, 58
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 73
  STORE r25, r0
  ADD r25, r9
  LDI r0, 77
  STORE r25, r0
  ADD r25, r9
  LDI r0, 58
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 90
  STORE r25, r0
  ADD r25, r9
  LDI r0, 58
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r0, 0
  STORE r25, r0

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r0, 91
  STORE r25, r0
  ADD r25, r9
  LDI r0, 43
  STORE r25, r0
  ADD r25, r9
  LDI r0, 47
  STORE r25, r0
  ADD r25, r9
  LDI r0, 45
  STORE r25, r0
  ADD r25, r9
  LDI r0, 93
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 122
  STORE r25, r0
  ADD r25, r9
  LDI r0, 111
  STORE r25, r0
  ADD r25, r9
  LDI r0, 111
  STORE r25, r0
  ADD r25, r9
  LDI r0, 109
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 91
  STORE r25, r0
  ADD r25, r9
  LDI r0, 87
  STORE r25, r0
  ADD r25, r9
  LDI r0, 65
  STORE r25, r0
  ADD r25, r9
  LDI r0, 83
  STORE r25, r0
  ADD r25, r9
  LDI r0, 68
  STORE r25, r0
  ADD r25, r9
  LDI r0, 93
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 112
  STORE r25, r0
  ADD r25, r9
  LDI r0, 97
  STORE r25, r0
  ADD r25, r9
  LDI r0, 110
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 91
  STORE r25, r0
  ADD r25, r9
  LDI r0, 82
  STORE r25, r0
  ADD r25, r9
  LDI r0, 93
  STORE r25, r0
  ADD r25, r9
  LDI r0, 32
  STORE r25, r0
  ADD r25, r9
  LDI r0, 114
  STORE r25, r0
  ADD r25, r9
  LDI r0, 101
  STORE r25, r0
  ADD r25, r9
  LDI r0, 115
  STORE r25, r0
  ADD r25, r9
  LDI r0, 101
  STORE r25, r0
  ADD r25, r9
  LDI r0, 116
  STORE r25, r0
  ADD r25, r9
  ; null terminate
  LDI r0, 0
  STORE r25, r0

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r10, 4
  LDI r5, 4
  LDI r7, 0x5200
  LDI r14, 0xFFFFFF
  LDI r15, 0x000000
  DRAWTEXT r10, r5, r7, r14, r15

  ; Line 2 at (4, 14) in dim gray
  LDI r10, 4
  LDI r5, 14
  LDI r7, 0x5280
  LDI r14, 0x888888
  LDI r15, 0x000000
  DRAWTEXT r10, r5, r7, r14, r15

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r13-r3
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r0, 0x80000000
  MOV r13, r22
  AND r13, r0
  JZ r13, hfs_positive
  ; Negative: write '-', negate value
  LDI r0, 45
  STORE r25, r0
  ADD r25, r9
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r13, r22
  SAR r13, r18        ; r13 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r13 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r0, 46
  STORE r25, r0
  ADD r25, r9
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r13, r22
  LDI r0, 0xFFF
  AND r13, r0         ; r13 = fractional bits (0-4095)
  LDI r0, 1000
  MUL r13, r0         ; r13 = frac * 1000
  LDI r0, 4096
  DIV r13, r0         ; r13 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r0, 100
  MOV r12, r13
  DIV r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  ; Tens digit
  MOV r12, r13
  LDI r0, 100
  MOD r12, r0
  LDI r0, 10
  DIV r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  ; Units digit
  MOV r12, r13
  LDI r0, 10
  MOD r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r13, r22
  SAR r13, r18        ; integer part
  CALL hud_write_u32
  LDI r0, 46
  STORE r25, r0
  ADD r25, r9
  MOV r13, r22
  LDI r0, 0xFFF
  AND r13, r0
  LDI r0, 1000
  MUL r13, r0
  LDI r0, 4096
  DIV r13, r0
  ; Hundreds
  LDI r0, 100
  MOV r12, r13
  DIV r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  ; Tens
  MOV r12, r13
  LDI r0, 100
  MOD r12, r0
  LDI r0, 10
  DIV r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  ; Units
  MOV r12, r13
  LDI r0, 10
  MOD r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r25, r12
  ADD r25, r9
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r13 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r13-r3
hud_write_u32:
  PUSH r31
  PUSH r10
  PUSH r5
  PUSH r7
  ; Special case: 0
  LDI r0, 0
  CMP r13, r0
  JNZ r2, hwu_nonzero
  LDI r0, 48
  STORE r25, r0
  ADD r25, r9
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r10, 0x5300    ; temp buffer
  LDI r5, 0         ; digit count
hwu_div_loop:
  LDI r0, 0
  CMP r13, r0
  JZ r2, hwu_flush
  LDI r0, 10
  MOV r12, r13
  MOD r12, r0
  LDI r0, 48
  ADD r12, r0
  STORE r10, r12
  ADD r10, r9
  ADD r5, r9
  LDI r0, 10
  DIV r13, r0
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r10, r9       ; point to last digit written
hwu_copy_loop:
  LDI r0, 0
  CMP r5, r0
  JZ r2, hwu_done
  LOAD r0, r10
  STORE r25, r0
  ADD r25, r9
  SUB r10, r9
  SUB r5, r9
  JMP hwu_copy_loop
hwu_done:
  POP r7
  POP r5
  POP r10
  POP r31
  RET
