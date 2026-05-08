; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r4, 0x000066
STORE r1, r4
ADD r1, r6
LDI r4, 0x0000CC
STORE r1, r4
ADD r1, r6
LDI r4, 0x0044FF
STORE r1, r4
ADD r1, r6
LDI r4, 0x00AAFF
STORE r1, r4
ADD r1, r6
LDI r4, 0x00FFCC
STORE r1, r4
ADD r1, r6
LDI r4, 0x00FF44
STORE r1, r4
ADD r1, r6
LDI r4, 0x44FF00
STORE r1, r4
ADD r1, r6
LDI r4, 0xAAFF00
STORE r1, r4
ADD r1, r6
LDI r4, 0xFFEE00
STORE r1, r4
ADD r1, r6
LDI r4, 0xFFAA00
STORE r1, r4
ADD r1, r6
LDI r4, 0xFF4400
STORE r1, r4
ADD r1, r6
LDI r4, 0xFF0000
STORE r1, r4
ADD r1, r6
LDI r4, 0xDD0044
STORE r1, r4
ADD r1, r6
LDI r4, 0xAA00AA
STORE r1, r4
ADD r1, r6
LDI r4, 0x550077
STORE r1, r4
ADD r1, r6
LDI r4, 0x220044
STORE r1, r4

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r1, 0x5100
LDI r4, 2048
NEG r4
STORE r1, r4
ADD r1, r6
; center_im = 0.0
LDI r4, 0
STORE r1, r4
ADD r1, r6
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r4, 6144
STORE r1, r4
ADD r1, r6
; max_iter = 24
LDI r4, 24
STORE r1, r4

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r7
  LDI r11, 43
  CMP r7, r11
  JZ r10, zoom_in
  LDI r11, 45
  CMP r7, r11
  JZ r10, zoom_out
  LDI r11, 87
  CMP r7, r11
  JZ r10, pan_up
  LDI r11, 83
  CMP r7, r11
  JZ r10, pan_down
  LDI r11, 65
  CMP r7, r11
  JZ r10, pan_left
  LDI r11, 68
  CMP r7, r11
  JZ r10, pan_right
  LDI r11, 82
  CMP r7, r11
  JZ r10, reset_view
  LDI r11, 81
  CMP r7, r11
  JZ r10, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r1, 0x5102
  LOAD r11, r1
  SAR r11, r17
  STORE r1, r11
  JMP main_loop

zoom_out:
  LDI r1, 0x5102
  LOAD r11, r1
  SHL r11, r17
  LDI r7, 24576
  CMP r11, r7
  BGE r10, main_loop
  STORE r1, r11
  JMP main_loop

pan_up:
  LDI r1, 0x5101
  LOAD r11, r1
  LDI r7, 0x5102
  LOAD r15, r7
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  SUB r11, r15
  STORE r1, r11
  JMP main_loop

pan_down:
  LDI r1, 0x5101
  LOAD r11, r1
  LDI r7, 0x5102
  LOAD r15, r7
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  ADD r11, r15
  STORE r1, r11
  JMP main_loop

pan_left:
  LDI r1, 0x5100
  LOAD r11, r1
  LDI r7, 0x5102
  LOAD r15, r7
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  SUB r11, r15
  STORE r1, r11
  JMP main_loop

pan_right:
  LDI r1, 0x5100
  LOAD r11, r1
  LDI r7, 0x5102
  LOAD r15, r7
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  ADD r11, r15
  STORE r1, r11
  JMP main_loop

reset_view:
  LDI r1, 0x5100
  LDI r4, 2048
  NEG r4
  STORE r1, r4
  ADD r1, r6
  LDI r4, 0
  STORE r1, r4
  ADD r1, r6
  LDI r4, 6144
  STORE r1, r4
  ADD r1, r6
  LDI r4, 24
  STORE r1, r4
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r4, 0
  FILL r4
  LDI r1, 0x5100
  LOAD r28, r1
  ADD r1, r6
  LOAD r29, r1
  ADD r1, r6
  LOAD r14, r1
  ADD r1, r6
  LOAD r5, r1
  LDI r13, 0
y_loop:
  LDI r12, 0
  MOV r4, r13
  SHL r4, r17
  ADD r4, r6
  SUB r4, r16
  MUL r4, r14
  SAR r4, r20
  ADD r4, r29
  MOV r2, r4
x_loop:
  MOV r4, r12
  SHL r4, r17
  ADD r4, r6
  SUB r4, r16
  MUL r4, r14
  SAR r4, r20
  ADD r4, r28
  MOV r3, r4
  LDI r8, 0
  LDI r9, 0
  LDI r0, 0
iter:
  MOV r4, r8
  MUL r4, r4
  MOV r7, r4
  MOV r11, r9
  MUL r11, r11
  ADD r7, r11
  CMP r7, r21
  BGE r10, escaped
  CMP r0, r5
  BGE r10, in_set
  SAR r4, r18
  SAR r11, r18
  SUB r4, r11
  ADD r4, r3
  MUL r8, r9
  SAR r8, r19
  ADD r8, r2
  MOV r9, r8
  MOV r8, r4
  ADD r0, r6
  JMP iter
escaped:
  LDI r11, 15
  AND r0, r11
  LDI r7, 0x5000
  ADD r0, r7
  LOAD r1, r0
  JMP draw
in_set:
  LDI r1, 0
draw:
  MOV r4, r12
  SHL r4, r17
  MOV r11, r13
  SHL r11, r17
  RECTF r4, r11, r17, r17, r1
  ADD r12, r6
  CMP r12, r16
  BLT r10, x_loop
  ADD r13, r6
  CMP r13, r16
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
  LDI r4, 82
  STORE r25, r4
  ADD r25, r6
  LDI r4, 69
  STORE r25, r4
  ADD r25, r6
  LDI r4, 58
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 73
  STORE r25, r4
  ADD r25, r6
  LDI r4, 77
  STORE r25, r4
  ADD r25, r6
  LDI r4, 58
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 90
  STORE r25, r4
  ADD r25, r6
  LDI r4, 58
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r4, 0
  STORE r25, r4

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r4, 91
  STORE r25, r4
  ADD r25, r6
  LDI r4, 43
  STORE r25, r4
  ADD r25, r6
  LDI r4, 47
  STORE r25, r4
  ADD r25, r6
  LDI r4, 45
  STORE r25, r4
  ADD r25, r6
  LDI r4, 93
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 122
  STORE r25, r4
  ADD r25, r6
  LDI r4, 111
  STORE r25, r4
  ADD r25, r6
  LDI r4, 111
  STORE r25, r4
  ADD r25, r6
  LDI r4, 109
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 91
  STORE r25, r4
  ADD r25, r6
  LDI r4, 87
  STORE r25, r4
  ADD r25, r6
  LDI r4, 65
  STORE r25, r4
  ADD r25, r6
  LDI r4, 83
  STORE r25, r4
  ADD r25, r6
  LDI r4, 68
  STORE r25, r4
  ADD r25, r6
  LDI r4, 93
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 112
  STORE r25, r4
  ADD r25, r6
  LDI r4, 97
  STORE r25, r4
  ADD r25, r6
  LDI r4, 110
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 91
  STORE r25, r4
  ADD r25, r6
  LDI r4, 82
  STORE r25, r4
  ADD r25, r6
  LDI r4, 93
  STORE r25, r4
  ADD r25, r6
  LDI r4, 32
  STORE r25, r4
  ADD r25, r6
  LDI r4, 114
  STORE r25, r4
  ADD r25, r6
  LDI r4, 101
  STORE r25, r4
  ADD r25, r6
  LDI r4, 115
  STORE r25, r4
  ADD r25, r6
  LDI r4, 101
  STORE r25, r4
  ADD r25, r6
  LDI r4, 116
  STORE r25, r4
  ADD r25, r6
  ; null terminate
  LDI r4, 0
  STORE r25, r4

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r7, 4
  LDI r15, 4
  LDI r14, 0x5200
  LDI r5, 0xFFFFFF
  LDI r1, 0x000000
  DRAWTEXT r7, r15, r14, r5, r1

  ; Line 2 at (4, 14) in dim gray
  LDI r7, 4
  LDI r15, 14
  LDI r14, 0x5280
  LDI r5, 0x888888
  LDI r1, 0x000000
  DRAWTEXT r7, r15, r14, r5, r1

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r12-r11
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r4, 0x80000000
  MOV r12, r22
  AND r12, r4
  JZ r12, hfs_positive
  ; Negative: write '-', negate value
  LDI r4, 45
  STORE r25, r4
  ADD r25, r6
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r12, r22
  SAR r12, r18        ; r12 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r12 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r4, 46
  STORE r25, r4
  ADD r25, r6
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r12, r22
  LDI r4, 0xFFF
  AND r12, r4         ; r12 = fractional bits (0-4095)
  LDI r4, 1000
  MUL r12, r4         ; r12 = frac * 1000
  LDI r4, 4096
  DIV r12, r4         ; r12 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r4, 100
  MOV r13, r12
  DIV r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  ; Tens digit
  MOV r13, r12
  LDI r4, 100
  MOD r13, r4
  LDI r4, 10
  DIV r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  ; Units digit
  MOV r13, r12
  LDI r4, 10
  MOD r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r12, r22
  SAR r12, r18        ; integer part
  CALL hud_write_u32
  LDI r4, 46
  STORE r25, r4
  ADD r25, r6
  MOV r12, r22
  LDI r4, 0xFFF
  AND r12, r4
  LDI r4, 1000
  MUL r12, r4
  LDI r4, 4096
  DIV r12, r4
  ; Hundreds
  LDI r4, 100
  MOV r13, r12
  DIV r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  ; Tens
  MOV r13, r12
  LDI r4, 100
  MOD r13, r4
  LDI r4, 10
  DIV r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  ; Units
  MOV r13, r12
  LDI r4, 10
  MOD r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r25, r13
  ADD r25, r6
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r12 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r12-r11
hud_write_u32:
  PUSH r31
  PUSH r7
  PUSH r15
  PUSH r14
  ; Special case: 0
  LDI r4, 0
  CMP r12, r4
  JNZ r10, hwu_nonzero
  LDI r4, 48
  STORE r25, r4
  ADD r25, r6
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r7, 0x5300    ; temp buffer
  LDI r15, 0         ; digit count
hwu_div_loop:
  LDI r4, 0
  CMP r12, r4
  JZ r10, hwu_flush
  LDI r4, 10
  MOV r13, r12
  MOD r13, r4
  LDI r4, 48
  ADD r13, r4
  STORE r7, r13
  ADD r7, r6
  ADD r15, r6
  LDI r4, 10
  DIV r12, r4
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r7, r6       ; point to last digit written
hwu_copy_loop:
  LDI r4, 0
  CMP r15, r4
  JZ r10, hwu_done
  LOAD r4, r7
  STORE r25, r4
  ADD r25, r6
  SUB r7, r6
  SUB r15, r6
  JMP hwu_copy_loop
hwu_done:
  POP r14
  POP r15
  POP r7
  POP r31
  RET
