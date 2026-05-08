; DESCRIPTION: Render a colored object at the screen.

; mandelbrot.asm - Mandelbrot Fractal Explorer
; Fixed-point 4.12 format (scale = 4096)
; 2x2 pixel blocks (128x128 = 16384 blocks)
; Controls: +/- zoom, WASD pan, R reset, Q quit
; HUD: displays center coordinates and zoom level

; === CONSTANTS ===
LDI r12, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 11
LDI r20, 7
LDI r21, 0x04000000

; === PALETTE at 0x5000 (16 escape colors) ===
LDI r4, 0x5000
LDI r9, 0x000066
STORE r4, r9
ADD r4, r12
LDI r9, 0x0000CC
STORE r4, r9
ADD r4, r12
LDI r9, 0x0044FF
STORE r4, r9
ADD r4, r12
LDI r9, 0x00AAFF
STORE r4, r9
ADD r4, r12
LDI r9, 0x00FFCC
STORE r4, r9
ADD r4, r12
LDI r9, 0x00FF44
STORE r4, r9
ADD r4, r12
LDI r9, 0x44FF00
STORE r4, r9
ADD r4, r12
LDI r9, 0xAAFF00
STORE r4, r9
ADD r4, r12
LDI r9, 0xFFEE00
STORE r4, r9
ADD r4, r12
LDI r9, 0xFFAA00
STORE r4, r9
ADD r4, r12
LDI r9, 0xFF4400
STORE r4, r9
ADD r4, r12
LDI r9, 0xFF0000
STORE r4, r9
ADD r4, r12
LDI r9, 0xDD0044
STORE r4, r9
ADD r4, r12
LDI r9, 0xAA00AA
STORE r4, r9
ADD r4, r12
LDI r9, 0x550077
STORE r4, r9
ADD r4, r12
LDI r9, 0x220044
STORE r4, r9

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r4, 0x5100
LDI r9, 2048
NEG r9
STORE r4, r9
ADD r4, r12
; center_im = 0.0
LDI r9, 0
STORE r4, r9
ADD r4, r12
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r9, 6144
STORE r4, r9
ADD r4, r12
; max_iter = 24
LDI r9, 24
STORE r4, r9

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r14
  LDI r15, 43
  CMP r14, r15
  JZ r6, zoom_in
  LDI r15, 45
  CMP r14, r15
  JZ r6, zoom_out
  LDI r15, 87
  CMP r14, r15
  JZ r6, pan_up
  LDI r15, 83
  CMP r14, r15
  JZ r6, pan_down
  LDI r15, 65
  CMP r14, r15
  JZ r6, pan_left
  LDI r15, 68
  CMP r14, r15
  JZ r6, pan_right
  LDI r15, 82
  CMP r14, r15
  JZ r6, reset_view
  LDI r15, 81
  CMP r14, r15
  JZ r6, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r4, 0x5102
  LOAD r15, r4
  SAR r15, r17
  STORE r4, r15
  JMP main_loop

zoom_out:
  LDI r4, 0x5102
  LOAD r15, r4
  SHL r15, r17
  LDI r14, 24576
  CMP r15, r14
  BGE r6, main_loop
  STORE r4, r15
  JMP main_loop

pan_up:
  LDI r4, 0x5101
  LOAD r15, r4
  LDI r14, 0x5102
  LOAD r5, r14
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  SUB r15, r5
  STORE r4, r15
  JMP main_loop

pan_down:
  LDI r4, 0x5101
  LOAD r15, r4
  LDI r14, 0x5102
  LOAD r5, r14
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  ADD r15, r5
  STORE r4, r15
  JMP main_loop

pan_left:
  LDI r4, 0x5100
  LOAD r15, r4
  LDI r14, 0x5102
  LOAD r5, r14
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  SUB r15, r5
  STORE r4, r15
  JMP main_loop

pan_right:
  LDI r4, 0x5100
  LOAD r15, r4
  LDI r14, 0x5102
  LOAD r5, r14
  SAR r5, r17
  SAR r5, r17
  SAR r5, r17
  ADD r15, r5
  STORE r4, r15
  JMP main_loop

reset_view:
  LDI r4, 0x5100
  LDI r9, 2048
  NEG r9
  STORE r4, r9
  ADD r4, r12
  LDI r9, 0
  STORE r4, r9
  ADD r4, r12
  LDI r9, 6144
  STORE r4, r9
  ADD r4, r12
  LDI r9, 24
  STORE r4, r9
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r9, 0
  FILL r9
  LDI r4, 0x5100
  LOAD r28, r4
  ADD r4, r12
  LOAD r29, r4
  ADD r4, r12
  LOAD r1, r4
  ADD r4, r12
  LOAD r10, r4
  LDI r3, 0
y_loop:
  LDI r13, 0
  MOV r9, r3
  SHL r9, r17
  ADD r9, r12
  SUB r9, r16
  MUL r9, r1
  SAR r9, r20
  ADD r9, r29
  MOV r11, r9
x_loop:
  MOV r9, r13
  SHL r9, r17
  ADD r9, r12
  SUB r9, r16
  MUL r9, r1
  SAR r9, r20
  ADD r9, r28
  MOV r8, r9
  LDI r7, 0
  LDI r0, 0
  LDI r2, 0
iter:
  MOV r9, r7
  MUL r9, r9
  MOV r14, r9
  MOV r15, r0
  MUL r15, r15
  ADD r14, r15
  CMP r14, r21
  BGE r6, escaped
  CMP r2, r10
  BGE r6, in_set
  SAR r9, r18
  SAR r15, r18
  SUB r9, r15
  ADD r9, r8
  MUL r7, r0
  SAR r7, r19
  ADD r7, r11
  MOV r0, r7
  MOV r7, r9
  ADD r2, r12
  JMP iter
escaped:
  LDI r15, 15
  AND r2, r15
  LDI r14, 0x5000
  ADD r2, r14
  LOAD r4, r2
  JMP draw
in_set:
  LDI r4, 0
draw:
  MOV r9, r13
  SHL r9, r17
  MOV r15, r3
  SHL r15, r17
  RECTF r9, r15, r17, r17, r4
  ADD r13, r12
  CMP r13, r16
  BLT r6, x_loop
  ADD r3, r12
  CMP r3, r16
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
  LDI r4, 0x5100
  LOAD r22, r4       ; r22 = center_re (fixed-point)
  ADD r4, r12
  LOAD r23, r4       ; r23 = center_im (fixed-point)
  ADD r4, r12
  LOAD r24, r4       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r9, 82
  STORE r25, r9
  ADD r25, r12
  LDI r9, 69
  STORE r25, r9
  ADD r25, r12
  LDI r9, 58
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 73
  STORE r25, r9
  ADD r25, r12
  LDI r9, 77
  STORE r25, r9
  ADD r25, r12
  LDI r9, 58
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 90
  STORE r25, r9
  ADD r25, r12
  LDI r9, 58
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12

  ; scale as unsigned decimal
  MOV r22, r24
  CALL hud_ufixed_to_str

  ; null terminate line 1
  LDI r9, 0
  STORE r25, r9

  ; === LINE 2: Controls help ===
  ; Write at 0x5280
  LDI r25, 0x5280
  LDI r9, 91
  STORE r25, r9
  ADD r25, r12
  LDI r9, 43
  STORE r25, r9
  ADD r25, r12
  LDI r9, 47
  STORE r25, r9
  ADD r25, r12
  LDI r9, 45
  STORE r25, r9
  ADD r25, r12
  LDI r9, 93
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 122
  STORE r25, r9
  ADD r25, r12
  LDI r9, 111
  STORE r25, r9
  ADD r25, r12
  LDI r9, 111
  STORE r25, r9
  ADD r25, r12
  LDI r9, 109
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 91
  STORE r25, r9
  ADD r25, r12
  LDI r9, 87
  STORE r25, r9
  ADD r25, r12
  LDI r9, 65
  STORE r25, r9
  ADD r25, r12
  LDI r9, 83
  STORE r25, r9
  ADD r25, r12
  LDI r9, 68
  STORE r25, r9
  ADD r25, r12
  LDI r9, 93
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 112
  STORE r25, r9
  ADD r25, r12
  LDI r9, 97
  STORE r25, r9
  ADD r25, r12
  LDI r9, 110
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 91
  STORE r25, r9
  ADD r25, r12
  LDI r9, 82
  STORE r25, r9
  ADD r25, r12
  LDI r9, 93
  STORE r25, r9
  ADD r25, r12
  LDI r9, 32
  STORE r25, r9
  ADD r25, r12
  LDI r9, 114
  STORE r25, r9
  ADD r25, r12
  LDI r9, 101
  STORE r25, r9
  ADD r25, r12
  LDI r9, 115
  STORE r25, r9
  ADD r25, r12
  LDI r9, 101
  STORE r25, r9
  ADD r25, r12
  LDI r9, 116
  STORE r25, r9
  ADD r25, r12
  ; null terminate
  LDI r9, 0
  STORE r25, r9

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r14, 4
  LDI r5, 4
  LDI r1, 0x5200
  LDI r10, 0xFFFFFF
  LDI r4, 0x000000
  DRAWTEXT r14, r5, r1, r10, r4

  ; Line 2 at (4, 14) in dim gray
  LDI r14, 4
  LDI r5, 14
  LDI r1, 0x5280
  LDI r10, 0x888888
  LDI r4, 0x000000
  DRAWTEXT r14, r5, r1, r10, r4

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r13-r15
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r9, 0x80000000
  MOV r13, r22
  AND r13, r9
  JZ r13, hfs_positive
  ; Negative: write '-', negate value
  LDI r9, 45
  STORE r25, r9
  ADD r25, r12
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r13, r22
  SAR r13, r18        ; r13 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r13 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r9, 46
  STORE r25, r9
  ADD r25, r12
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r13, r22
  LDI r9, 0xFFF
  AND r13, r9         ; r13 = fractional bits (0-4095)
  LDI r9, 1000
  MUL r13, r9         ; r13 = frac * 1000
  LDI r9, 4096
  DIV r13, r9         ; r13 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r9, 100
  MOV r3, r13
  DIV r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  ; Tens digit
  MOV r3, r13
  LDI r9, 100
  MOD r3, r9
  LDI r9, 10
  DIV r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  ; Units digit
  MOV r3, r13
  LDI r9, 10
  MOD r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r13, r22
  SAR r13, r18        ; integer part
  CALL hud_write_u32
  LDI r9, 46
  STORE r25, r9
  ADD r25, r12
  MOV r13, r22
  LDI r9, 0xFFF
  AND r13, r9
  LDI r9, 1000
  MUL r13, r9
  LDI r9, 4096
  DIV r13, r9
  ; Hundreds
  LDI r9, 100
  MOV r3, r13
  DIV r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  ; Tens
  MOV r3, r13
  LDI r9, 100
  MOD r3, r9
  LDI r9, 10
  DIV r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  ; Units
  MOV r3, r13
  LDI r9, 10
  MOD r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r25, r3
  ADD r25, r12
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r13 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r13-r15
hud_write_u32:
  PUSH r31
  PUSH r14
  PUSH r5
  PUSH r1
  ; Special case: 0
  LDI r9, 0
  CMP r13, r9
  JNZ r6, hwu_nonzero
  LDI r9, 48
  STORE r25, r9
  ADD r25, r12
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r14, 0x5300    ; temp buffer
  LDI r5, 0         ; digit count
hwu_div_loop:
  LDI r9, 0
  CMP r13, r9
  JZ r6, hwu_flush
  LDI r9, 10
  MOV r3, r13
  MOD r3, r9
  LDI r9, 48
  ADD r3, r9
  STORE r14, r3
  ADD r14, r12
  ADD r5, r12
  LDI r9, 10
  DIV r13, r9
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r14, r12       ; point to last digit written
hwu_copy_loop:
  LDI r9, 0
  CMP r5, r9
  JZ r6, hwu_done
  LOAD r9, r14
  STORE r25, r9
  ADD r25, r12
  SUB r14, r12
  SUB r5, r12
  JMP hwu_copy_loop
hwu_done:
  POP r1
  POP r5
  POP r14
  POP r31
  RET
