; DESCRIPTION: Render a colored object at the screen.

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
LDI r2, 0x5000
LDI r0, 0x000066
STORE r2, r0
ADD r2, r13
LDI r0, 0x0000CC
STORE r2, r0
ADD r2, r13
LDI r0, 0x0044FF
STORE r2, r0
ADD r2, r13
LDI r0, 0x00AAFF
STORE r2, r0
ADD r2, r13
LDI r0, 0x00FFCC
STORE r2, r0
ADD r2, r13
LDI r0, 0x00FF44
STORE r2, r0
ADD r2, r13
LDI r0, 0x44FF00
STORE r2, r0
ADD r2, r13
LDI r0, 0xAAFF00
STORE r2, r0
ADD r2, r13
LDI r0, 0xFFEE00
STORE r2, r0
ADD r2, r13
LDI r0, 0xFFAA00
STORE r2, r0
ADD r2, r13
LDI r0, 0xFF4400
STORE r2, r0
ADD r2, r13
LDI r0, 0xFF0000
STORE r2, r0
ADD r2, r13
LDI r0, 0xDD0044
STORE r2, r0
ADD r2, r13
LDI r0, 0xAA00AA
STORE r2, r0
ADD r2, r13
LDI r0, 0x550077
STORE r2, r0
ADD r2, r13
LDI r0, 0x220044
STORE r2, r0

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r2, 0x5100
LDI r0, 2048
NEG r0
STORE r2, r0
ADD r2, r13
; center_im = 0.0
LDI r0, 0
STORE r2, r0
ADD r2, r13
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r0, 6144
STORE r2, r0
ADD r2, r13
; max_iter = 24
LDI r0, 24
STORE r2, r0

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r8
  LDI r9, 43
  CMP r8, r9
  JZ r12, zoom_in
  LDI r9, 45
  CMP r8, r9
  JZ r12, zoom_out
  LDI r9, 87
  CMP r8, r9
  JZ r12, pan_up
  LDI r9, 83
  CMP r8, r9
  JZ r12, pan_down
  LDI r9, 65
  CMP r8, r9
  JZ r12, pan_left
  LDI r9, 68
  CMP r8, r9
  JZ r12, pan_right
  LDI r9, 82
  CMP r8, r9
  JZ r12, reset_view
  LDI r9, 81
  CMP r8, r9
  JZ r12, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r2, 0x5102
  LOAD r9, r2
  SAR r9, r17
  STORE r2, r9
  JMP main_loop

zoom_out:
  LDI r2, 0x5102
  LOAD r9, r2
  SHL r9, r17
  LDI r8, 24576
  CMP r9, r8
  BGE r12, main_loop
  STORE r2, r9
  JMP main_loop

pan_up:
  LDI r2, 0x5101
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r3, r8
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  SUB r9, r3
  STORE r2, r9
  JMP main_loop

pan_down:
  LDI r2, 0x5101
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r3, r8
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  ADD r9, r3
  STORE r2, r9
  JMP main_loop

pan_left:
  LDI r2, 0x5100
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r3, r8
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  SUB r9, r3
  STORE r2, r9
  JMP main_loop

pan_right:
  LDI r2, 0x5100
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r3, r8
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  ADD r9, r3
  STORE r2, r9
  JMP main_loop

reset_view:
  LDI r2, 0x5100
  LDI r0, 2048
  NEG r0
  STORE r2, r0
  ADD r2, r13
  LDI r0, 0
  STORE r2, r0
  ADD r2, r13
  LDI r0, 6144
  STORE r2, r0
  ADD r2, r13
  LDI r0, 24
  STORE r2, r0
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r0, 0
  FILL r0
  LDI r2, 0x5100
  LOAD r28, r2
  ADD r2, r13
  LOAD r29, r2
  ADD r2, r13
  LOAD r4, r2
  ADD r2, r13
  LOAD r5, r2
  LDI r11, 0
y_loop:
  LDI r7, 0
  MOV r0, r11
  SHL r0, r17
  ADD r0, r13
  SUB r0, r16
  MUL r0, r4
  SAR r0, r20
  ADD r0, r29
  MOV r15, r0
x_loop:
  MOV r0, r7
  SHL r0, r17
  ADD r0, r13
  SUB r0, r16
  MUL r0, r4
  SAR r0, r20
  ADD r0, r28
  MOV r14, r0
  LDI r10, 0
  LDI r1, 0
  LDI r6, 0
iter:
  MOV r0, r10
  MUL r0, r0
  MOV r8, r0
  MOV r9, r1
  MUL r9, r9
  ADD r8, r9
  CMP r8, r21
  BGE r12, escaped
  CMP r6, r5
  BGE r12, in_set
  SAR r0, r18
  SAR r9, r18
  SUB r0, r9
  ADD r0, r14
  MUL r10, r1
  SAR r10, r19
  ADD r10, r15
  MOV r1, r10
  MOV r10, r0
  ADD r6, r13
  JMP iter
escaped:
  LDI r9, 15
  AND r6, r9
  LDI r8, 0x5000
  ADD r6, r8
  LOAD r2, r6
  JMP draw
in_set:
  LDI r2, 0
draw:
  MOV r0, r7
  SHL r0, r17
  MOV r9, r11
  SHL r9, r17
  RECTF r0, r9, r17, r17, r2
  ADD r7, r13
  CMP r7, r16
  BLT r12, x_loop
  ADD r11, r13
  CMP r11, r16
  BLT r12, y_loop
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
  LDI r2, 0x5100
  LOAD r22, r2       ; r22 = center_re (fixed-point)
  ADD r2, r13
  LOAD r23, r2       ; r23 = center_im (fixed-point)
  ADD r2, r13
  LOAD r24, r2       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r0, 82
  STORE r25, r0
  ADD r25, r13
  LDI r0, 69
  STORE r25, r0
  ADD r25, r13
  LDI r0, 58
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 73
  STORE r25, r0
  ADD r25, r13
  LDI r0, 77
  STORE r25, r0
  ADD r25, r13
  LDI r0, 58
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 90
  STORE r25, r0
  ADD r25, r13
  LDI r0, 58
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13

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
  ADD r25, r13
  LDI r0, 43
  STORE r25, r0
  ADD r25, r13
  LDI r0, 47
  STORE r25, r0
  ADD r25, r13
  LDI r0, 45
  STORE r25, r0
  ADD r25, r13
  LDI r0, 93
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 122
  STORE r25, r0
  ADD r25, r13
  LDI r0, 111
  STORE r25, r0
  ADD r25, r13
  LDI r0, 111
  STORE r25, r0
  ADD r25, r13
  LDI r0, 109
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 91
  STORE r25, r0
  ADD r25, r13
  LDI r0, 87
  STORE r25, r0
  ADD r25, r13
  LDI r0, 65
  STORE r25, r0
  ADD r25, r13
  LDI r0, 83
  STORE r25, r0
  ADD r25, r13
  LDI r0, 68
  STORE r25, r0
  ADD r25, r13
  LDI r0, 93
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 112
  STORE r25, r0
  ADD r25, r13
  LDI r0, 97
  STORE r25, r0
  ADD r25, r13
  LDI r0, 110
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 91
  STORE r25, r0
  ADD r25, r13
  LDI r0, 82
  STORE r25, r0
  ADD r25, r13
  LDI r0, 93
  STORE r25, r0
  ADD r25, r13
  LDI r0, 32
  STORE r25, r0
  ADD r25, r13
  LDI r0, 114
  STORE r25, r0
  ADD r25, r13
  LDI r0, 101
  STORE r25, r0
  ADD r25, r13
  LDI r0, 115
  STORE r25, r0
  ADD r25, r13
  LDI r0, 101
  STORE r25, r0
  ADD r25, r13
  LDI r0, 116
  STORE r25, r0
  ADD r25, r13
  ; null terminate
  LDI r0, 0
  STORE r25, r0

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r8, 4
  LDI r3, 4
  LDI r4, 0x5200
  LDI r5, 0xFFFFFF
  LDI r2, 0x000000
  DRAWTEXT r8, r3, r4, r5, r2

  ; Line 2 at (4, 14) in dim gray
  LDI r8, 4
  LDI r3, 14
  LDI r4, 0x5280
  LDI r5, 0x888888
  LDI r2, 0x000000
  DRAWTEXT r8, r3, r4, r5, r2

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r7-r9
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r0, 0x80000000
  MOV r7, r22
  AND r7, r0
  JZ r7, hfs_positive
  ; Negative: write '-', negate value
  LDI r0, 45
  STORE r25, r0
  ADD r25, r13
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r7, r22
  SAR r7, r18        ; r7 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r7 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r0, 46
  STORE r25, r0
  ADD r25, r13
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r7, r22
  LDI r0, 0xFFF
  AND r7, r0         ; r7 = fractional bits (0-4095)
  LDI r0, 1000
  MUL r7, r0         ; r7 = frac * 1000
  LDI r0, 4096
  DIV r7, r0         ; r7 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r0, 100
  MOV r11, r7
  DIV r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  ; Tens digit
  MOV r11, r7
  LDI r0, 100
  MOD r11, r0
  LDI r0, 10
  DIV r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  ; Units digit
  MOV r11, r7
  LDI r0, 10
  MOD r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r7, r22
  SAR r7, r18        ; integer part
  CALL hud_write_u32
  LDI r0, 46
  STORE r25, r0
  ADD r25, r13
  MOV r7, r22
  LDI r0, 0xFFF
  AND r7, r0
  LDI r0, 1000
  MUL r7, r0
  LDI r0, 4096
  DIV r7, r0
  ; Hundreds
  LDI r0, 100
  MOV r11, r7
  DIV r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  ; Tens
  MOV r11, r7
  LDI r0, 100
  MOD r11, r0
  LDI r0, 10
  DIV r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  ; Units
  MOV r11, r7
  LDI r0, 10
  MOD r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r25, r11
  ADD r25, r13
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r7 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r7-r9
hud_write_u32:
  PUSH r31
  PUSH r8
  PUSH r3
  PUSH r4
  ; Special case: 0
  LDI r0, 0
  CMP r7, r0
  JNZ r12, hwu_nonzero
  LDI r0, 48
  STORE r25, r0
  ADD r25, r13
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r8, 0x5300    ; temp buffer
  LDI r3, 0         ; digit count
hwu_div_loop:
  LDI r0, 0
  CMP r7, r0
  JZ r12, hwu_flush
  LDI r0, 10
  MOV r11, r7
  MOD r11, r0
  LDI r0, 48
  ADD r11, r0
  STORE r8, r11
  ADD r8, r13
  ADD r3, r13
  LDI r0, 10
  DIV r7, r0
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r8, r13       ; point to last digit written
hwu_copy_loop:
  LDI r0, 0
  CMP r3, r0
  JZ r12, hwu_done
  LOAD r0, r8
  STORE r25, r0
  ADD r25, r13
  SUB r8, r13
  SUB r3, r13
  JMP hwu_copy_loop
hwu_done:
  POP r4
  POP r3
  POP r8
  POP r31
  RET
