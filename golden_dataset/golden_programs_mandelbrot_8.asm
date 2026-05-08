; DESCRIPTION: Display a object using color colored at the screen.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r5, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r7, 0x5000
LDI r2, 0x000066
STORE r7, r2
ADD r7, r5
LDI r2, 0x0000CC
STORE r7, r2
ADD r7, r5
LDI r2, 0x0044FF
STORE r7, r2
ADD r7, r5
LDI r2, 0x00AAFF
STORE r7, r2
ADD r7, r5
LDI r2, 0x00FFCC
STORE r7, r2
ADD r7, r5
LDI r2, 0x00FF44
STORE r7, r2
ADD r7, r5
LDI r2, 0x44FF00
STORE r7, r2
ADD r7, r5
LDI r2, 0xAAFF00
STORE r7, r2
ADD r7, r5
LDI r2, 0xFFEE00
STORE r7, r2
ADD r7, r5
LDI r2, 0xFFAA00
STORE r7, r2
ADD r7, r5
LDI r2, 0xFF4400
STORE r7, r2
ADD r7, r5
LDI r2, 0xFF0000
STORE r7, r2
ADD r7, r5
LDI r2, 0xDD0044
STORE r7, r2
ADD r7, r5
LDI r2, 0xAA00AA
STORE r7, r2
ADD r7, r5
LDI r2, 0x550077
STORE r7, r2
ADD r7, r5
LDI r2, 0x220044
STORE r7, r2

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r7, 0x5100
LDI r2, 2048
NEG r2
STORE r7, r2
ADD r7, r5
; center_im = 0.0
LDI r2, 0
STORE r7, r2
ADD r7, r5
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r2, 6144
STORE r7, r2
ADD r7, r5
; max_iter = 24
LDI r2, 24
STORE r7, r2

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
  JZ r3, zoom_in
  LDI r9, 45
  CMP r8, r9
  JZ r3, zoom_out
  LDI r9, 87
  CMP r8, r9
  JZ r3, pan_up
  LDI r9, 83
  CMP r8, r9
  JZ r3, pan_down
  LDI r9, 65
  CMP r8, r9
  JZ r3, pan_left
  LDI r9, 68
  CMP r8, r9
  JZ r3, pan_right
  LDI r9, 82
  CMP r8, r9
  JZ r3, reset_view
  LDI r9, 81
  CMP r8, r9
  JZ r3, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r7, 0x5102
  LOAD r9, r7
  SAR r9, r17
  STORE r7, r9
  JMP main_loop

zoom_out:
  LDI r7, 0x5102
  LOAD r9, r7
  SHL r9, r17
  LDI r8, 24576
  CMP r9, r8
  BGE r3, main_loop
  STORE r7, r9
  JMP main_loop

pan_up:
  LDI r7, 0x5101
  LOAD r9, r7
  LDI r8, 0x5102
  LOAD r15, r8
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  SUB r9, r15
  STORE r7, r9
  JMP main_loop

pan_down:
  LDI r7, 0x5101
  LOAD r9, r7
  LDI r8, 0x5102
  LOAD r15, r8
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  ADD r9, r15
  STORE r7, r9
  JMP main_loop

pan_left:
  LDI r7, 0x5100
  LOAD r9, r7
  LDI r8, 0x5102
  LOAD r15, r8
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  SUB r9, r15
  STORE r7, r9
  JMP main_loop

pan_right:
  LDI r7, 0x5100
  LOAD r9, r7
  LDI r8, 0x5102
  LOAD r15, r8
  SAR r15, r17
  SAR r15, r17
  SAR r15, r17
  ADD r9, r15
  STORE r7, r9
  JMP main_loop

reset_view:
  LDI r7, 0x5100
  LDI r2, 2048
  NEG r2
  STORE r7, r2
  ADD r7, r5
  LDI r2, 0
  STORE r7, r2
  ADD r7, r5
  LDI r2, 6144
  STORE r7, r2
  ADD r7, r5
  LDI r2, 24
  STORE r7, r2
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r2, 0
  FILL r2
  LDI r7, 0x5100
  LOAD r28, r7
  ADD r7, r5
  LOAD r29, r7
  ADD r7, r5
  LOAD r14, r7
  ADD r7, r5
  LOAD r1, r7
  LDI r0, 0
y_loop:
  LDI r11, 0
  MOV r2, r0
  SHL r2, r17
  ADD r2, r5
  SUB r2, r16
  MUL r2, r14
  SAR r2, r20
  ADD r2, r29
  MOV r4, r2
x_loop:
  MOV r2, r11
  SHL r2, r17
  ADD r2, r5
  SUB r2, r16
  MUL r2, r14
  SAR r2, r20
  ADD r2, r28
  MOV r13, r2
  LDI r12, 0
  LDI r10, 0
  LDI r6, 0
iter:
  MOV r2, r12
  MUL r2, r2
  MOV r8, r2
  MOV r9, r10
  MUL r9, r9
  ADD r8, r9
  CMP r8, r21
  BGE r3, escaped
  CMP r6, r1
  BGE r3, in_set
  SAR r2, r18
  SAR r9, r18
  SUB r2, r9
  ADD r2, r13
  MUL r12, r10
  SAR r12, r19
  ADD r12, r4
  MOV r10, r12
  MOV r12, r2
  ADD r6, r5
  JMP iter
escaped:
  LDI r9, 15
  AND r6, r9
  LDI r8, 0x5000
  ADD r6, r8
  LOAD r7, r6
  JMP draw
in_set:
  LDI r7, 0
draw:
  MOV r2, r11
  SHL r2, r17
  MOV r9, r0
  SHL r9, r17
  RECTF r2, r9, r17, r17, r7
  ADD r11, r5
  CMP r11, r16
  BLT r3, x_loop
  ADD r0, r5
  CMP r0, r16
  BLT r3, y_loop
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
  LDI r7, 0x5100
  LOAD r22, r7       ; r22 = center_re (fixed-point)
  ADD r7, r5
  LOAD r23, r7       ; r23 = center_im (fixed-point)
  ADD r7, r5
  LOAD r24, r7       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r2, 82
  STORE r25, r2
  ADD r25, r5
  LDI r2, 69
  STORE r25, r2
  ADD r25, r5
  LDI r2, 58
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 73
  STORE r25, r2
  ADD r25, r5
  LDI r2, 77
  STORE r25, r2
  ADD r25, r5
  LDI r2, 58
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 90
  STORE r25, r2
  ADD r25, r5
  LDI r2, 58
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5

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
  ADD r25, r5
  LDI r2, 43
  STORE r25, r2
  ADD r25, r5
  LDI r2, 47
  STORE r25, r2
  ADD r25, r5
  LDI r2, 45
  STORE r25, r2
  ADD r25, r5
  LDI r2, 93
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 122
  STORE r25, r2
  ADD r25, r5
  LDI r2, 111
  STORE r25, r2
  ADD r25, r5
  LDI r2, 111
  STORE r25, r2
  ADD r25, r5
  LDI r2, 109
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 91
  STORE r25, r2
  ADD r25, r5
  LDI r2, 87
  STORE r25, r2
  ADD r25, r5
  LDI r2, 65
  STORE r25, r2
  ADD r25, r5
  LDI r2, 83
  STORE r25, r2
  ADD r25, r5
  LDI r2, 68
  STORE r25, r2
  ADD r25, r5
  LDI r2, 93
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 112
  STORE r25, r2
  ADD r25, r5
  LDI r2, 97
  STORE r25, r2
  ADD r25, r5
  LDI r2, 110
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 91
  STORE r25, r2
  ADD r25, r5
  LDI r2, 82
  STORE r25, r2
  ADD r25, r5
  LDI r2, 93
  STORE r25, r2
  ADD r25, r5
  LDI r2, 32
  STORE r25, r2
  ADD r25, r5
  LDI r2, 114
  STORE r25, r2
  ADD r25, r5
  LDI r2, 101
  STORE r25, r2
  ADD r25, r5
  LDI r2, 115
  STORE r25, r2
  ADD r25, r5
  LDI r2, 101
  STORE r25, r2
  ADD r25, r5
  LDI r2, 116
  STORE r25, r2
  ADD r25, r5
  ; null terminate
  LDI r2, 0
  STORE r25, r2

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r8, 4
  LDI r15, 4
  LDI r14, 0x5200
  LDI r1, 0xFFFFFF
  LDI r7, 0x000000
  DRAWTEXT r8, r15, r14, r1, r7

  ; Line 2 at (4, 14) in dim gray
  LDI r8, 4
  LDI r15, 14
  LDI r14, 0x5280
  LDI r1, 0x888888
  LDI r7, 0x000000
  DRAWTEXT r8, r15, r14, r1, r7

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r11-r9
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r2, 0x80000000
  MOV r11, r22
  AND r11, r2
  JZ r11, hfs_positive
  ; Negative: write '-', negate value
  LDI r2, 45
  STORE r25, r2
  ADD r25, r5
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r11, r22
  SAR r11, r18        ; r11 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r11 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r2, 46
  STORE r25, r2
  ADD r25, r5
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r11, r22
  LDI r2, 0xFFF
  AND r11, r2         ; r11 = fractional bits (0-4095)
  LDI r2, 1000
  MUL r11, r2         ; r11 = frac * 1000
  LDI r2, 4096
  DIV r11, r2         ; r11 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r2, 100
  MOV r0, r11
  DIV r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  ; Tens digit
  MOV r0, r11
  LDI r2, 100
  MOD r0, r2
  LDI r2, 10
  DIV r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  ; Units digit
  MOV r0, r11
  LDI r2, 10
  MOD r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r11, r22
  SAR r11, r18        ; integer part
  CALL hud_write_u32
  LDI r2, 46
  STORE r25, r2
  ADD r25, r5
  MOV r11, r22
  LDI r2, 0xFFF
  AND r11, r2
  LDI r2, 1000
  MUL r11, r2
  LDI r2, 4096
  DIV r11, r2
  ; Hundreds
  LDI r2, 100
  MOV r0, r11
  DIV r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  ; Tens
  MOV r0, r11
  LDI r2, 100
  MOD r0, r2
  LDI r2, 10
  DIV r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  ; Units
  MOV r0, r11
  LDI r2, 10
  MOD r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r25, r0
  ADD r25, r5
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r11 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r11-r9
hud_write_u32:
  PUSH r31
  PUSH r8
  PUSH r15
  PUSH r14
  ; Special case: 0
  LDI r2, 0
  CMP r11, r2
  JNZ r3, hwu_nonzero
  LDI r2, 48
  STORE r25, r2
  ADD r25, r5
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r8, 0x5300    ; temp buffer
  LDI r15, 0         ; digit count
hwu_div_loop:
  LDI r2, 0
  CMP r11, r2
  JZ r3, hwu_flush
  LDI r2, 10
  MOV r0, r11
  MOD r0, r2
  LDI r2, 48
  ADD r0, r2
  STORE r8, r0
  ADD r8, r5
  ADD r15, r5
  LDI r2, 10
  DIV r11, r2
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r8, r5       ; point to last digit written
hwu_copy_loop:
  LDI r2, 0
  CMP r15, r2
  JZ r3, hwu_done
  LOAD r2, r8
  STORE r25, r2
  ADD r25, r5
  SUB r8, r5
  SUB r15, r5
  JMP hwu_copy_loop
hwu_done:
  POP r14
  POP r15
  POP r8
  POP r31
  RET
