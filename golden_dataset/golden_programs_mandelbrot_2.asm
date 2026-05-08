; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r2, 0x5000
LDI r11, 0x000066
STORE r2, r11
ADD r2, r4
LDI r11, 0x0000CC
STORE r2, r11
ADD r2, r4
LDI r11, 0x0044FF
STORE r2, r11
ADD r2, r4
LDI r11, 0x00AAFF
STORE r2, r11
ADD r2, r4
LDI r11, 0x00FFCC
STORE r2, r11
ADD r2, r4
LDI r11, 0x00FF44
STORE r2, r11
ADD r2, r4
LDI r11, 0x44FF00
STORE r2, r11
ADD r2, r4
LDI r11, 0xAAFF00
STORE r2, r11
ADD r2, r4
LDI r11, 0xFFEE00
STORE r2, r11
ADD r2, r4
LDI r11, 0xFFAA00
STORE r2, r11
ADD r2, r4
LDI r11, 0xFF4400
STORE r2, r11
ADD r2, r4
LDI r11, 0xFF0000
STORE r2, r11
ADD r2, r4
LDI r11, 0xDD0044
STORE r2, r11
ADD r2, r4
LDI r11, 0xAA00AA
STORE r2, r11
ADD r2, r4
LDI r11, 0x550077
STORE r2, r11
ADD r2, r4
LDI r11, 0x220044
STORE r2, r11

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r2, 0x5100
LDI r11, 2048
NEG r11
STORE r2, r11
ADD r2, r4
; center_im = 0.0
LDI r11, 0
STORE r2, r11
ADD r2, r4
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r11, 6144
STORE r2, r11
ADD r2, r4
; max_iter = 24
LDI r11, 24
STORE r2, r11

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
  LOAD r7, r8
  SAR r7, r17
  SAR r7, r17
  SAR r7, r17
  SUB r9, r7
  STORE r2, r9
  JMP main_loop

pan_down:
  LDI r2, 0x5101
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r7, r8
  SAR r7, r17
  SAR r7, r17
  SAR r7, r17
  ADD r9, r7
  STORE r2, r9
  JMP main_loop

pan_left:
  LDI r2, 0x5100
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r7, r8
  SAR r7, r17
  SAR r7, r17
  SAR r7, r17
  SUB r9, r7
  STORE r2, r9
  JMP main_loop

pan_right:
  LDI r2, 0x5100
  LOAD r9, r2
  LDI r8, 0x5102
  LOAD r7, r8
  SAR r7, r17
  SAR r7, r17
  SAR r7, r17
  ADD r9, r7
  STORE r2, r9
  JMP main_loop

reset_view:
  LDI r2, 0x5100
  LDI r11, 2048
  NEG r11
  STORE r2, r11
  ADD r2, r4
  LDI r11, 0
  STORE r2, r11
  ADD r2, r4
  LDI r11, 6144
  STORE r2, r11
  ADD r2, r4
  LDI r11, 24
  STORE r2, r11
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r11, 0
  FILL r11
  LDI r2, 0x5100
  LOAD r28, r2
  ADD r2, r4
  LOAD r29, r2
  ADD r2, r4
  LOAD r15, r2
  ADD r2, r4
  LOAD r1, r2
  LDI r10, 0
y_loop:
  LDI r6, 0
  MOV r11, r10
  SHL r11, r17
  ADD r11, r4
  SUB r11, r16
  MUL r11, r15
  SAR r11, r20
  ADD r11, r29
  MOV r0, r11
x_loop:
  MOV r11, r6
  SHL r11, r17
  ADD r11, r4
  SUB r11, r16
  MUL r11, r15
  SAR r11, r20
  ADD r11, r28
  MOV r5, r11
  LDI r14, 0
  LDI r3, 0
  LDI r13, 0
iter:
  MOV r11, r14
  MUL r11, r11
  MOV r8, r11
  MOV r9, r3
  MUL r9, r9
  ADD r8, r9
  CMP r8, r21
  BGE r12, escaped
  CMP r13, r1
  BGE r12, in_set
  SAR r11, r18
  SAR r9, r18
  SUB r11, r9
  ADD r11, r5
  MUL r14, r3
  SAR r14, r19
  ADD r14, r0
  MOV r3, r14
  MOV r14, r11
  ADD r13, r4
  JMP iter
escaped:
  LDI r9, 15
  AND r13, r9
  LDI r8, 0x5000
  ADD r13, r8
  LOAD r2, r13
  JMP draw
in_set:
  LDI r2, 0
draw:
  MOV r11, r6
  SHL r11, r17
  MOV r9, r10
  SHL r9, r17
  RECTF r11, r9, r17, r17, r2
  ADD r6, r4
  CMP r6, r16
  BLT r12, x_loop
  ADD r10, r4
  CMP r10, r16
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
  ADD r2, r4
  LOAD r23, r2       ; r23 = center_im (fixed-point)
  ADD r2, r4
  LOAD r24, r2       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r11, 82
  STORE r25, r11
  ADD r25, r4
  LDI r11, 69
  STORE r25, r11
  ADD r25, r4
  LDI r11, 58
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 73
  STORE r25, r11
  ADD r25, r4
  LDI r11, 77
  STORE r25, r11
  ADD r25, r4
  LDI r11, 58
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 90
  STORE r25, r11
  ADD r25, r4
  LDI r11, 58
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r11, 0
  STORE r25, r11

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r11, 91
  STORE r25, r11
  ADD r25, r4
  LDI r11, 43
  STORE r25, r11
  ADD r25, r4
  LDI r11, 47
  STORE r25, r11
  ADD r25, r4
  LDI r11, 45
  STORE r25, r11
  ADD r25, r4
  LDI r11, 93
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 122
  STORE r25, r11
  ADD r25, r4
  LDI r11, 111
  STORE r25, r11
  ADD r25, r4
  LDI r11, 111
  STORE r25, r11
  ADD r25, r4
  LDI r11, 109
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 91
  STORE r25, r11
  ADD r25, r4
  LDI r11, 87
  STORE r25, r11
  ADD r25, r4
  LDI r11, 65
  STORE r25, r11
  ADD r25, r4
  LDI r11, 83
  STORE r25, r11
  ADD r25, r4
  LDI r11, 68
  STORE r25, r11
  ADD r25, r4
  LDI r11, 93
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 112
  STORE r25, r11
  ADD r25, r4
  LDI r11, 97
  STORE r25, r11
  ADD r25, r4
  LDI r11, 110
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 91
  STORE r25, r11
  ADD r25, r4
  LDI r11, 82
  STORE r25, r11
  ADD r25, r4
  LDI r11, 93
  STORE r25, r11
  ADD r25, r4
  LDI r11, 32
  STORE r25, r11
  ADD r25, r4
  LDI r11, 114
  STORE r25, r11
  ADD r25, r4
  LDI r11, 101
  STORE r25, r11
  ADD r25, r4
  LDI r11, 115
  STORE r25, r11
  ADD r25, r4
  LDI r11, 101
  STORE r25, r11
  ADD r25, r4
  LDI r11, 116
  STORE r25, r11
  ADD r25, r4
  ; null terminate
  LDI r11, 0
  STORE r25, r11

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r8, 4
  LDI r7, 4
  LDI r15, 0x5200
  LDI r1, 0xFFFFFF
  LDI r2, 0x000000
  DRAWTEXT r8, r7, r15, r1, r2

  ; Line 2 at (4, 14) in dim gray
  LDI r8, 4
  LDI r7, 14
  LDI r15, 0x5280
  LDI r1, 0x888888
  LDI r2, 0x000000
  DRAWTEXT r8, r7, r15, r1, r2

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r6-r9
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r11, 0x80000000
  MOV r6, r22
  AND r6, r11
  JZ r6, hfs_positive
  ; Negative: write '-', negate value
  LDI r11, 45
  STORE r25, r11
  ADD r25, r4
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r6, r22
  SAR r6, r18        ; r6 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r6 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r11, 46
  STORE r25, r11
  ADD r25, r4
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r6, r22
  LDI r11, 0xFFF
  AND r6, r11         ; r6 = fractional bits (0-4095)
  LDI r11, 1000
  MUL r6, r11         ; r6 = frac * 1000
  LDI r11, 4096
  DIV r6, r11         ; r6 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r11, 100
  MOV r10, r6
  DIV r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  ; Tens digit
  MOV r10, r6
  LDI r11, 100
  MOD r10, r11
  LDI r11, 10
  DIV r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  ; Units digit
  MOV r10, r6
  LDI r11, 10
  MOD r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r6, r22
  SAR r6, r18        ; integer part
  CALL hud_write_u32
  LDI r11, 46
  STORE r25, r11
  ADD r25, r4
  MOV r6, r22
  LDI r11, 0xFFF
  AND r6, r11
  LDI r11, 1000
  MUL r6, r11
  LDI r11, 4096
  DIV r6, r11
  ; Hundreds
  LDI r11, 100
  MOV r10, r6
  DIV r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  ; Tens
  MOV r10, r6
  LDI r11, 100
  MOD r10, r11
  LDI r11, 10
  DIV r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  ; Units
  MOV r10, r6
  LDI r11, 10
  MOD r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r25, r10
  ADD r25, r4
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r6 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r6-r9
hud_write_u32:
  PUSH r31
  PUSH r8
  PUSH r7
  PUSH r15
  ; Special case: 0
  LDI r11, 0
  CMP r6, r11
  JNZ r12, hwu_nonzero
  LDI r11, 48
  STORE r25, r11
  ADD r25, r4
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r8, 0x5300    ; temp buffer
  LDI r7, 0         ; digit count
hwu_div_loop:
  LDI r11, 0
  CMP r6, r11
  JZ r12, hwu_flush
  LDI r11, 10
  MOV r10, r6
  MOD r10, r11
  LDI r11, 48
  ADD r10, r11
  STORE r8, r10
  ADD r8, r4
  ADD r7, r4
  LDI r11, 10
  DIV r6, r11
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r8, r4       ; point to last digit written
hwu_copy_loop:
  LDI r11, 0
  CMP r7, r11
  JZ r12, hwu_done
  LOAD r11, r8
  STORE r25, r11
  ADD r25, r4
  SUB r8, r4
  SUB r7, r4
  JMP hwu_copy_loop
hwu_done:
  POP r15
  POP r7
  POP r8
  POP r31
  RET
