; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
LDI r1, 0x5000
LDI r2, 0x000066
STORE r1, r2
ADD r1, r0
LDI r2, 0x0000CC
STORE r1, r2
ADD r1, r0
LDI r2, 0x0044FF
STORE r1, r2
ADD r1, r0
LDI r2, 0x00AAFF
STORE r1, r2
ADD r1, r0
LDI r2, 0x00FFCC
STORE r1, r2
ADD r1, r0
LDI r2, 0x00FF44
STORE r1, r2
ADD r1, r0
LDI r2, 0x44FF00
STORE r1, r2
ADD r1, r0
LDI r2, 0xAAFF00
STORE r1, r2
ADD r1, r0
LDI r2, 0xFFEE00
STORE r1, r2
ADD r1, r0
LDI r2, 0xFFAA00
STORE r1, r2
ADD r1, r0
LDI r2, 0xFF4400
STORE r1, r2
ADD r1, r0
LDI r2, 0xFF0000
STORE r1, r2
ADD r1, r0
LDI r2, 0xDD0044
STORE r1, r2
ADD r1, r0
LDI r2, 0xAA00AA
STORE r1, r2
ADD r1, r0
LDI r2, 0x550077
STORE r1, r2
ADD r1, r0
LDI r2, 0x220044
STORE r1, r2

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r1, 0x5100
LDI r2, 2048
NEG r2
STORE r1, r2
ADD r1, r0
; center_im = 0.0
LDI r2, 0
STORE r1, r2
ADD r1, r0
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r2, 6144
STORE r1, r2
ADD r1, r0
; max_iter = 24
LDI r2, 24
STORE r1, r2

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r4
  LDI r15, 43
  CMP r4, r15
  JZ r6, zoom_in
  LDI r15, 45
  CMP r4, r15
  JZ r6, zoom_out
  LDI r15, 87
  CMP r4, r15
  JZ r6, pan_up
  LDI r15, 83
  CMP r4, r15
  JZ r6, pan_down
  LDI r15, 65
  CMP r4, r15
  JZ r6, pan_left
  LDI r15, 68
  CMP r4, r15
  JZ r6, pan_right
  LDI r15, 82
  CMP r4, r15
  JZ r6, reset_view
  LDI r15, 81
  CMP r4, r15
  JZ r6, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r1, 0x5102
  LOAD r15, r1
  SAR r15, r17
  STORE r1, r15
  JMP main_loop

zoom_out:
  LDI r1, 0x5102
  LOAD r15, r1
  SHL r15, r17
  LDI r4, 24576
  CMP r15, r4
  BGE r6, main_loop
  STORE r1, r15
  JMP main_loop

pan_up:
  LDI r1, 0x5101
  LOAD r15, r1
  LDI r4, 0x5102
  LOAD r3, r4
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  SUB r15, r3
  STORE r1, r15
  JMP main_loop

pan_down:
  LDI r1, 0x5101
  LOAD r15, r1
  LDI r4, 0x5102
  LOAD r3, r4
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  ADD r15, r3
  STORE r1, r15
  JMP main_loop

pan_left:
  LDI r1, 0x5100
  LOAD r15, r1
  LDI r4, 0x5102
  LOAD r3, r4
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  SUB r15, r3
  STORE r1, r15
  JMP main_loop

pan_right:
  LDI r1, 0x5100
  LOAD r15, r1
  LDI r4, 0x5102
  LOAD r3, r4
  SAR r3, r17
  SAR r3, r17
  SAR r3, r17
  ADD r15, r3
  STORE r1, r15
  JMP main_loop

reset_view:
  LDI r1, 0x5100
  LDI r2, 2048
  NEG r2
  STORE r1, r2
  ADD r1, r0
  LDI r2, 0
  STORE r1, r2
  ADD r1, r0
  LDI r2, 6144
  STORE r1, r2
  ADD r1, r0
  LDI r2, 24
  STORE r1, r2
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r2, 0
  FILL r2
  LDI r1, 0x5100
  LOAD r28, r1
  ADD r1, r0
  LOAD r29, r1
  ADD r1, r0
  LOAD r11, r1
  ADD r1, r0
  LOAD r5, r1
  LDI r10, 0
y_loop:
  LDI r12, 0
  MOV r2, r10
  SHL r2, r17
  ADD r2, r0
  SUB r2, r16
  MUL r2, r11
  SAR r2, r20
  ADD r2, r29
  MOV r8, r2
x_loop:
  MOV r2, r12
  SHL r2, r17
  ADD r2, r0
  SUB r2, r16
  MUL r2, r11
  SAR r2, r20
  ADD r2, r28
  MOV r9, r2
  LDI r13, 0
  LDI r14, 0
  LDI r7, 0
iter:
  MOV r2, r13
  MUL r2, r2
  MOV r4, r2
  MOV r15, r14
  MUL r15, r15
  ADD r4, r15
  CMP r4, r21
  BGE r6, escaped
  CMP r7, r5
  BGE r6, in_set
  SAR r2, r18
  SAR r15, r18
  SUB r2, r15
  ADD r2, r9
  MUL r13, r14
  SAR r13, r19
  ADD r13, r8
  MOV r14, r13
  MOV r13, r2
  ADD r7, r0
  JMP iter
escaped:
  LDI r15, 15
  AND r7, r15
  LDI r4, 0x5000
  ADD r7, r4
  LOAD r1, r7
  JMP draw
in_set:
  LDI r1, 0
draw:
  MOV r2, r12
  SHL r2, r17
  MOV r15, r10
  SHL r15, r17
  RECTF r2, r15, r17, r17, r1
  ADD r12, r0
  CMP r12, r16
  BLT r6, x_loop
  ADD r10, r0
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
  LDI r1, 0x5100
  LOAD r22, r1       ; r22 = center_re (fixed-point)
  ADD r1, r0
  LOAD r23, r1       ; r23 = center_im (fixed-point)
  ADD r1, r0
  LOAD r24, r1       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r2, 82
  STORE r25, r2
  ADD r25, r0
  LDI r2, 69
  STORE r25, r2
  ADD r25, r0
  LDI r2, 58
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 73
  STORE r25, r2
  ADD r25, r0
  LDI r2, 77
  STORE r25, r2
  ADD r25, r0
  LDI r2, 58
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 90
  STORE r25, r2
  ADD r25, r0
  LDI r2, 58
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0

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
  ADD r25, r0
  LDI r2, 43
  STORE r25, r2
  ADD r25, r0
  LDI r2, 47
  STORE r25, r2
  ADD r25, r0
  LDI r2, 45
  STORE r25, r2
  ADD r25, r0
  LDI r2, 93
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 122
  STORE r25, r2
  ADD r25, r0
  LDI r2, 111
  STORE r25, r2
  ADD r25, r0
  LDI r2, 111
  STORE r25, r2
  ADD r25, r0
  LDI r2, 109
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 91
  STORE r25, r2
  ADD r25, r0
  LDI r2, 87
  STORE r25, r2
  ADD r25, r0
  LDI r2, 65
  STORE r25, r2
  ADD r25, r0
  LDI r2, 83
  STORE r25, r2
  ADD r25, r0
  LDI r2, 68
  STORE r25, r2
  ADD r25, r0
  LDI r2, 93
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 112
  STORE r25, r2
  ADD r25, r0
  LDI r2, 97
  STORE r25, r2
  ADD r25, r0
  LDI r2, 110
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 91
  STORE r25, r2
  ADD r25, r0
  LDI r2, 82
  STORE r25, r2
  ADD r25, r0
  LDI r2, 93
  STORE r25, r2
  ADD r25, r0
  LDI r2, 32
  STORE r25, r2
  ADD r25, r0
  LDI r2, 114
  STORE r25, r2
  ADD r25, r0
  LDI r2, 101
  STORE r25, r2
  ADD r25, r0
  LDI r2, 115
  STORE r25, r2
  ADD r25, r0
  LDI r2, 101
  STORE r25, r2
  ADD r25, r0
  LDI r2, 116
  STORE r25, r2
  ADD r25, r0
  ; null terminate
  LDI r2, 0
  STORE r25, r2

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r4, 4
  LDI r3, 4
  LDI r11, 0x5200
  LDI r5, 0xFFFFFF
  LDI r1, 0x000000
  DRAWTEXT r4, r3, r11, r5, r1

  ; Line 2 at (4, 14) in dim gray
  LDI r4, 4
  LDI r3, 14
  LDI r11, 0x5280
  LDI r5, 0x888888
  LDI r1, 0x000000
  DRAWTEXT r4, r3, r11, r5, r1

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r12-r15
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r2, 0x80000000
  MOV r12, r22
  AND r12, r2
  JZ r12, hfs_positive
  ; Negative: write '-', negate value
  LDI r2, 45
  STORE r25, r2
  ADD r25, r0
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r12, r22
  SAR r12, r18        ; r12 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r12 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r2, 46
  STORE r25, r2
  ADD r25, r0
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r12, r22
  LDI r2, 0xFFF
  AND r12, r2         ; r12 = fractional bits (0-4095)
  LDI r2, 1000
  MUL r12, r2         ; r12 = frac * 1000
  LDI r2, 4096
  DIV r12, r2         ; r12 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r2, 100
  MOV r10, r12
  DIV r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  ; Tens digit
  MOV r10, r12
  LDI r2, 100
  MOD r10, r2
  LDI r2, 10
  DIV r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  ; Units digit
  MOV r10, r12
  LDI r2, 10
  MOD r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r12, r22
  SAR r12, r18        ; integer part
  CALL hud_write_u32
  LDI r2, 46
  STORE r25, r2
  ADD r25, r0
  MOV r12, r22
  LDI r2, 0xFFF
  AND r12, r2
  LDI r2, 1000
  MUL r12, r2
  LDI r2, 4096
  DIV r12, r2
  ; Hundreds
  LDI r2, 100
  MOV r10, r12
  DIV r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  ; Tens
  MOV r10, r12
  LDI r2, 100
  MOD r10, r2
  LDI r2, 10
  DIV r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  ; Units
  MOV r10, r12
  LDI r2, 10
  MOD r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r25, r10
  ADD r25, r0
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r12 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r12-r15
hud_write_u32:
  PUSH r31
  PUSH r4
  PUSH r3
  PUSH r11
  ; Special case: 0
  LDI r2, 0
  CMP r12, r2
  JNZ r6, hwu_nonzero
  LDI r2, 48
  STORE r25, r2
  ADD r25, r0
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r4, 0x5300    ; temp buffer
  LDI r3, 0         ; digit count
hwu_div_loop:
  LDI r2, 0
  CMP r12, r2
  JZ r6, hwu_flush
  LDI r2, 10
  MOV r10, r12
  MOD r10, r2
  LDI r2, 48
  ADD r10, r2
  STORE r4, r10
  ADD r4, r0
  ADD r3, r0
  LDI r2, 10
  DIV r12, r2
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r4, r0       ; point to last digit written
hwu_copy_loop:
  LDI r2, 0
  CMP r3, r2
  JZ r6, hwu_done
  LOAD r2, r4
  STORE r25, r2
  ADD r25, r0
  SUB r4, r0
  SUB r3, r0
  JMP hwu_copy_loop
hwu_done:
  POP r11
  POP r3
  POP r4
  POP r31
  RET
