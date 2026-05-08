; DESCRIPTION: This GeOS assembly code implements a Mandelbrot fractal explorer using fixed-point arithmetic. It renders a 128x128 grid of 2x2 pixel blocks, allowing users to zoom in/out and pan around the fractal with keyboard controls ('+', '-', WASD), reset the view with 'R', and quit with 'Q'. The HUD displays the current center coordinates and zoom level.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r0, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r3, 0x5000
LDI r1, 0x000066
STORE r3, r1
ADD r3, r0
LDI r1, 0x0000CC
STORE r3, r1
ADD r3, r0
LDI r1, 0x0044FF
STORE r3, r1
ADD r3, r0
LDI r1, 0x00AAFF
STORE r3, r1
ADD r3, r0
LDI r1, 0x00FFCC
STORE r3, r1
ADD r3, r0
LDI r1, 0x00FF44
STORE r3, r1
ADD r3, r0
LDI r1, 0x44FF00
STORE r3, r1
ADD r3, r0
LDI r1, 0xAAFF00
STORE r3, r1
ADD r3, r0
LDI r1, 0xFFEE00
STORE r3, r1
ADD r3, r0
LDI r1, 0xFFAA00
STORE r3, r1
ADD r3, r0
LDI r1, 0xFF4400
STORE r3, r1
ADD r3, r0
LDI r1, 0xFF0000
STORE r3, r1
ADD r3, r0
LDI r1, 0xDD0044
STORE r3, r1
ADD r3, r0
LDI r1, 0xAA00AA
STORE r3, r1
ADD r3, r0
LDI r1, 0x550077
STORE r3, r1
ADD r3, r0
LDI r1, 0x220044
STORE r3, r1

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r3, 0x5100
LDI r1, 2048
NEG r1
STORE r3, r1
ADD r3, r0
; center_im = 0.0
LDI r1, 0
STORE r3, r1
ADD r3, r0
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r1, 6144
STORE r3, r1
ADD r3, r0
; max_iter = 24
LDI r1, 24
STORE r3, r1

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r9
  LDI r4, 43
  CMP r9, r4
  JZ r5, zoom_in
  LDI r4, 45
  CMP r9, r4
  JZ r5, zoom_out
  LDI r4, 87
  CMP r9, r4
  JZ r5, pan_up
  LDI r4, 83
  CMP r9, r4
  JZ r5, pan_down
  LDI r4, 65
  CMP r9, r4
  JZ r5, pan_left
  LDI r4, 68
  CMP r9, r4
  JZ r5, pan_right
  LDI r4, 82
  CMP r9, r4
  JZ r5, reset_view
  LDI r4, 81
  CMP r9, r4
  JZ r5, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r3, 0x5102
  LOAD r4, r3
  SAR r4, r17
  STORE r3, r4
  JMP main_loop

zoom_out:
  LDI r3, 0x5102
  LOAD r4, r3
  SHL r4, r17
  LDI r9, 24576
  CMP r4, r9
  BGE r5, main_loop
  STORE r3, r4
  JMP main_loop

pan_up:
  LDI r3, 0x5101
  LOAD r4, r3
  LDI r9, 0x5102
  LOAD r8, r9
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r4, r8
  STORE r3, r4
  JMP main_loop

pan_down:
  LDI r3, 0x5101
  LOAD r4, r3
  LDI r9, 0x5102
  LOAD r8, r9
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r4, r8
  STORE r3, r4
  JMP main_loop

pan_left:
  LDI r3, 0x5100
  LOAD r4, r3
  LDI r9, 0x5102
  LOAD r8, r9
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r4, r8
  STORE r3, r4
  JMP main_loop

pan_right:
  LDI r3, 0x5100
  LOAD r4, r3
  LDI r9, 0x5102
  LOAD r8, r9
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r4, r8
  STORE r3, r4
  JMP main_loop

reset_view:
  LDI r3, 0x5100
  LDI r1, 2048
  NEG r1
  STORE r3, r1
  ADD r3, r0
  LDI r1, 0
  STORE r3, r1
  ADD r3, r0
  LDI r1, 6144
  STORE r3, r1
  ADD r3, r0
  LDI r1, 24
  STORE r3, r1
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r1, 0
  FILL r1
  LDI r3, 0x5100
  LOAD r28, r3
  ADD r3, r0
  LOAD r29, r3
  ADD r3, r0
  LOAD r7, r3
  ADD r3, r0
  LOAD r14, r3
  LDI r12, 0
y_loop:
  LDI r10, 0
  MOV r1, r12
  SHL r1, r17
  ADD r1, r0
  SUB r1, r16
  MUL r1, r7
  SAR r1, r20
  ADD r1, r29
  MOV r6, r1
x_loop:
  MOV r1, r10
  SHL r1, r17
  ADD r1, r0
  SUB r1, r16
  MUL r1, r7
  SAR r1, r20
  ADD r1, r28
  MOV r11, r1
  LDI r13, 0
  LDI r15, 0
  LDI r2, 0
iter:
  MOV r1, r13
  MUL r1, r1
  MOV r9, r1
  MOV r4, r15
  MUL r4, r4
  ADD r9, r4
  CMP r9, r21
  BGE r5, escaped
  CMP r2, r14
  BGE r5, in_set
  SAR r1, r18
  SAR r4, r18
  SUB r1, r4
  ADD r1, r11
  MUL r13, r15
  SAR r13, r19
  ADD r13, r6
  MOV r15, r13
  MOV r13, r1
  ADD r2, r0
  JMP iter
escaped:
  LDI r4, 15
  AND r2, r4
  LDI r9, 0x5000
  ADD r2, r9
  LOAD r3, r2
  JMP draw
in_set:
  LDI r3, 0
draw:
  MOV r1, r10
  SHL r1, r17
  MOV r4, r12
  SHL r4, r17
  RECTF r1, r4, r17, r17, r3
  ADD r10, r0
  CMP r10, r16
  BLT r5, x_loop
  ADD r12, r0
  CMP r12, r16
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
  LDI r3, 0x5100
  LOAD r22, r3       ; r22 = center_re (fixed-point)
  ADD r3, r0
  LOAD r23, r3       ; r23 = center_im (fixed-point)
  ADD r3, r0
  LOAD r24, r3       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r1, 82
  STORE r25, r1
  ADD r25, r0
  LDI r1, 69
  STORE r25, r1
  ADD r25, r0
  LDI r1, 58
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 73
  STORE r25, r1
  ADD r25, r0
  LDI r1, 77
  STORE r25, r1
  ADD r25, r0
  LDI r1, 58
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 90
  STORE r25, r1
  ADD r25, r0
  LDI r1, 58
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r1, 0
  STORE r25, r1

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r1, 91
  STORE r25, r1
  ADD r25, r0
  LDI r1, 43
  STORE r25, r1
  ADD r25, r0
  LDI r1, 47
  STORE r25, r1
  ADD r25, r0
  LDI r1, 45
  STORE r25, r1
  ADD r25, r0
  LDI r1, 93
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 122
  STORE r25, r1
  ADD r25, r0
  LDI r1, 111
  STORE r25, r1
  ADD r25, r0
  LDI r1, 111
  STORE r25, r1
  ADD r25, r0
  LDI r1, 109
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 91
  STORE r25, r1
  ADD r25, r0
  LDI r1, 87
  STORE r25, r1
  ADD r25, r0
  LDI r1, 65
  STORE r25, r1
  ADD r25, r0
  LDI r1, 83
  STORE r25, r1
  ADD r25, r0
  LDI r1, 68
  STORE r25, r1
  ADD r25, r0
  LDI r1, 93
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 112
  STORE r25, r1
  ADD r25, r0
  LDI r1, 97
  STORE r25, r1
  ADD r25, r0
  LDI r1, 110
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 91
  STORE r25, r1
  ADD r25, r0
  LDI r1, 82
  STORE r25, r1
  ADD r25, r0
  LDI r1, 93
  STORE r25, r1
  ADD r25, r0
  LDI r1, 32
  STORE r25, r1
  ADD r25, r0
  LDI r1, 114
  STORE r25, r1
  ADD r25, r0
  LDI r1, 101
  STORE r25, r1
  ADD r25, r0
  LDI r1, 115
  STORE r25, r1
  ADD r25, r0
  LDI r1, 101
  STORE r25, r1
  ADD r25, r0
  LDI r1, 116
  STORE r25, r1
  ADD r25, r0
  ; null terminate
  LDI r1, 0
  STORE r25, r1

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r9, 4
  LDI r8, 4
  LDI r7, 0x5200
  LDI r14, 0xFFFFFF
  LDI r3, 0x000000
  DRAWTEXT r9, r8, r7, r14, r3

  ; Line 2 at (4, 14) in dim gray
  LDI r9, 4
  LDI r8, 14
  LDI r7, 0x5280
  LDI r14, 0x888888
  LDI r3, 0x000000
  DRAWTEXT r9, r8, r7, r14, r3

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r10-r4
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r1, 0x80000000
  MOV r10, r22
  AND r10, r1
  JZ r10, hfs_positive
  ; Negative: write '-', negate value
  LDI r1, 45
  STORE r25, r1
  ADD r25, r0
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r10, r22
  SAR r10, r18        ; r10 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r10 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r1, 46
  STORE r25, r1
  ADD r25, r0
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r10, r22
  LDI r1, 0xFFF
  AND r10, r1         ; r10 = fractional bits (0-4095)
  LDI r1, 1000
  MUL r10, r1         ; r10 = frac * 1000
  LDI r1, 4096
  DIV r10, r1         ; r10 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r1, 100
  MOV r12, r10
  DIV r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  ; Tens digit
  MOV r12, r10
  LDI r1, 100
  MOD r12, r1
  LDI r1, 10
  DIV r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  ; Units digit
  MOV r12, r10
  LDI r1, 10
  MOD r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r10, r22
  SAR r10, r18        ; integer part
  CALL hud_write_u32
  LDI r1, 46
  STORE r25, r1
  ADD r25, r0
  MOV r10, r22
  LDI r1, 0xFFF
  AND r10, r1
  LDI r1, 1000
  MUL r10, r1
  LDI r1, 4096
  DIV r10, r1
  ; Hundreds
  LDI r1, 100
  MOV r12, r10
  DIV r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  ; Tens
  MOV r12, r10
  LDI r1, 100
  MOD r12, r1
  LDI r1, 10
  DIV r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  ; Units
  MOV r12, r10
  LDI r1, 10
  MOD r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r25, r12
  ADD r25, r0
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r10 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r10-r4
hud_write_u32:
  PUSH r31
  PUSH r9
  PUSH r8
  PUSH r7
  ; Special case: 0
  LDI r1, 0
  CMP r10, r1
  JNZ r5, hwu_nonzero
  LDI r1, 48
  STORE r25, r1
  ADD r25, r0
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r9, 0x5300    ; temp buffer
  LDI r8, 0         ; digit count
hwu_div_loop:
  LDI r1, 0
  CMP r10, r1
  JZ r5, hwu_flush
  LDI r1, 10
  MOV r12, r10
  MOD r12, r1
  LDI r1, 48
  ADD r12, r1
  STORE r9, r12
  ADD r9, r0
  ADD r8, r0
  LDI r1, 10
  DIV r10, r1
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r9, r0       ; point to last digit written
hwu_copy_loop:
  LDI r1, 0
  CMP r8, r1
  JZ r5, hwu_done
  LOAD r1, r9
  STORE r25, r1
  ADD r25, r0
  SUB r9, r0
  SUB r8, r0
  JMP hwu_copy_loop
hwu_done:
  POP r7
  POP r8
  POP r9
  POP r31
  RET
