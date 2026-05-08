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
LDI r6, 0x5000
LDI r11, 0x000066
STORE r6, r11
ADD r6, r12
LDI r11, 0x0000CC
STORE r6, r11
ADD r6, r12
LDI r11, 0x0044FF
STORE r6, r11
ADD r6, r12
LDI r11, 0x00AAFF
STORE r6, r11
ADD r6, r12
LDI r11, 0x00FFCC
STORE r6, r11
ADD r6, r12
LDI r11, 0x00FF44
STORE r6, r11
ADD r6, r12
LDI r11, 0x44FF00
STORE r6, r11
ADD r6, r12
LDI r11, 0xAAFF00
STORE r6, r11
ADD r6, r12
LDI r11, 0xFFEE00
STORE r6, r11
ADD r6, r12
LDI r11, 0xFFAA00
STORE r6, r11
ADD r6, r12
LDI r11, 0xFF4400
STORE r6, r11
ADD r6, r12
LDI r11, 0xFF0000
STORE r6, r11
ADD r6, r12
LDI r11, 0xDD0044
STORE r6, r11
ADD r6, r12
LDI r11, 0xAA00AA
STORE r6, r11
ADD r6, r12
LDI r11, 0x550077
STORE r6, r11
ADD r6, r12
LDI r11, 0x220044
STORE r6, r11

; === VIEW PARAMS at 0x5100 ===
; center_re = -0.5 (fixed: -2048)
LDI r6, 0x5100
LDI r11, 2048
NEG r11
STORE r6, r11
ADD r6, r12
; center_im = 0.0
LDI r11, 0
STORE r6, r11
ADD r6, r12
; scale = 1.5 (fixed: 6144, view width = 3.0)
LDI r11, 6144
STORE r6, r11
ADD r6, r12
; max_iter = 24
LDI r11, 24
STORE r6, r11

; === STACK POINTER ===
LDI r30, 0xFF00

; === MAIN LOOP ===
main_loop:
  CALL render
  CALL draw_hud
  FRAME
  IKEY r3
  LDI r10, 43
  CMP r3, r10
  JZ r15, zoom_in
  LDI r10, 45
  CMP r3, r10
  JZ r15, zoom_out
  LDI r10, 87
  CMP r3, r10
  JZ r15, pan_up
  LDI r10, 83
  CMP r3, r10
  JZ r15, pan_down
  LDI r10, 65
  CMP r3, r10
  JZ r15, pan_left
  LDI r10, 68
  CMP r3, r10
  JZ r15, pan_right
  LDI r10, 82
  CMP r3, r10
  JZ r15, reset_view
  LDI r10, 81
  CMP r3, r10
  JZ r15, do_quit
  JMP main_loop

; === INPUT HANDLERS ===
zoom_in:
  LDI r6, 0x5102
  LOAD r10, r6
  SAR r10, r17
  STORE r6, r10
  JMP main_loop

zoom_out:
  LDI r6, 0x5102
  LOAD r10, r6
  SHL r10, r17
  LDI r3, 24576
  CMP r10, r3
  BGE r15, main_loop
  STORE r6, r10
  JMP main_loop

pan_up:
  LDI r6, 0x5101
  LOAD r10, r6
  LDI r3, 0x5102
  LOAD r8, r3
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r10, r8
  STORE r6, r10
  JMP main_loop

pan_down:
  LDI r6, 0x5101
  LOAD r10, r6
  LDI r3, 0x5102
  LOAD r8, r3
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r10, r8
  STORE r6, r10
  JMP main_loop

pan_left:
  LDI r6, 0x5100
  LOAD r10, r6
  LDI r3, 0x5102
  LOAD r8, r3
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  SUB r10, r8
  STORE r6, r10
  JMP main_loop

pan_right:
  LDI r6, 0x5100
  LOAD r10, r6
  LDI r3, 0x5102
  LOAD r8, r3
  SAR r8, r17
  SAR r8, r17
  SAR r8, r17
  ADD r10, r8
  STORE r6, r10
  JMP main_loop

reset_view:
  LDI r6, 0x5100
  LDI r11, 2048
  NEG r11
  STORE r6, r11
  ADD r6, r12
  LDI r11, 0
  STORE r6, r11
  ADD r6, r12
  LDI r11, 6144
  STORE r6, r11
  ADD r6, r12
  LDI r11, 24
  STORE r6, r11
  JMP main_loop

do_quit:
  HALT

; === RENDER FUNCTION ===
; Renders 128x128 blocks of 2x2 pixels each
render:
  PUSH r31
  LDI r11, 0
  FILL r11
  LDI r6, 0x5100
  LOAD r28, r6
  ADD r6, r12
  LOAD r29, r6
  ADD r6, r12
  LOAD r13, r6
  ADD r6, r12
  LOAD r9, r6
  LDI r2, 0
y_loop:
  LDI r0, 0
  MOV r11, r2
  SHL r11, r17
  ADD r11, r12
  SUB r11, r16
  MUL r11, r13
  SAR r11, r20
  ADD r11, r29
  MOV r1, r11
x_loop:
  MOV r11, r0
  SHL r11, r17
  ADD r11, r12
  SUB r11, r16
  MUL r11, r13
  SAR r11, r20
  ADD r11, r28
  MOV r4, r11
  LDI r7, 0
  LDI r5, 0
  LDI r14, 0
iter:
  MOV r11, r7
  MUL r11, r11
  MOV r3, r11
  MOV r10, r5
  MUL r10, r10
  ADD r3, r10
  CMP r3, r21
  BGE r15, escaped
  CMP r14, r9
  BGE r15, in_set
  SAR r11, r18
  SAR r10, r18
  SUB r11, r10
  ADD r11, r4
  MUL r7, r5
  SAR r7, r19
  ADD r7, r1
  MOV r5, r7
  MOV r7, r11
  ADD r14, r12
  JMP iter
escaped:
  LDI r10, 15
  AND r14, r10
  LDI r3, 0x5000
  ADD r14, r3
  LOAD r6, r14
  JMP draw
in_set:
  LDI r6, 0
draw:
  MOV r11, r0
  SHL r11, r17
  MOV r10, r2
  SHL r10, r17
  RECTF r11, r10, r17, r17, r6
  ADD r0, r12
  CMP r0, r16
  BLT r15, x_loop
  ADD r2, r12
  CMP r2, r16
  BLT r15, y_loop
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
  LDI r6, 0x5100
  LOAD r22, r6       ; r22 = center_re (fixed-point)
  ADD r6, r12
  LOAD r23, r6       ; r23 = center_im (fixed-point)
  ADD r6, r12
  LOAD r24, r6       ; r24 = scale (fixed-point)

  ; === LINE 1: "RE: X.XXXX  IM: X.XXXX  Z: X.XXXX" ===
  ; Write at 0x5200
  LDI r25, 0x5200     ; buffer pointer

  ; "RE: "
  LDI r11, 82
  STORE r25, r11
  ADD r25, r12
  LDI r11, 69
  STORE r25, r11
  ADD r25, r12
  LDI r11, 58
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12

  ; center_re as signed decimal with 3 fractional digits
  CALL hud_fixed_to_str

  ; "  IM: "
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 73
  STORE r25, r11
  ADD r25, r12
  LDI r11, 77
  STORE r25, r11
  ADD r25, r12
  LDI r11, 58
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12

  ; center_im as signed decimal
  MOV r22, r23
  CALL hud_fixed_to_str

  ; "  Z: "
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 90
  STORE r25, r11
  ADD r25, r12
  LDI r11, 58
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12

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
  ADD r25, r12
  LDI r11, 43
  STORE r25, r11
  ADD r25, r12
  LDI r11, 47
  STORE r25, r11
  ADD r25, r12
  LDI r11, 45
  STORE r25, r11
  ADD r25, r12
  LDI r11, 93
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 122
  STORE r25, r11
  ADD r25, r12
  LDI r11, 111
  STORE r25, r11
  ADD r25, r12
  LDI r11, 111
  STORE r25, r11
  ADD r25, r12
  LDI r11, 109
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 91
  STORE r25, r11
  ADD r25, r12
  LDI r11, 87
  STORE r25, r11
  ADD r25, r12
  LDI r11, 65
  STORE r25, r11
  ADD r25, r12
  LDI r11, 83
  STORE r25, r11
  ADD r25, r12
  LDI r11, 68
  STORE r25, r11
  ADD r25, r12
  LDI r11, 93
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 112
  STORE r25, r11
  ADD r25, r12
  LDI r11, 97
  STORE r25, r11
  ADD r25, r12
  LDI r11, 110
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 91
  STORE r25, r11
  ADD r25, r12
  LDI r11, 82
  STORE r25, r11
  ADD r25, r12
  LDI r11, 93
  STORE r25, r11
  ADD r25, r12
  LDI r11, 32
  STORE r25, r11
  ADD r25, r12
  LDI r11, 114
  STORE r25, r11
  ADD r25, r12
  LDI r11, 101
  STORE r25, r11
  ADD r25, r12
  LDI r11, 115
  STORE r25, r11
  ADD r25, r12
  LDI r11, 101
  STORE r25, r11
  ADD r25, r12
  LDI r11, 116
  STORE r25, r11
  ADD r25, r12
  ; null terminate
  LDI r11, 0
  STORE r25, r11

  ; === RENDER TEXT ON SCREEN ===
  ; Line 1 at (4, 4) in white text on dark background
  LDI r3, 4
  LDI r8, 4
  LDI r13, 0x5200
  LDI r9, 0xFFFFFF
  LDI r6, 0x000000
  DRAWTEXT r3, r8, r13, r9, r6

  ; Line 2 at (4, 14) in dim gray
  LDI r3, 4
  LDI r8, 14
  LDI r13, 0x5280
  LDI r9, 0x888888
  LDI r6, 0x000000
  DRAWTEXT r3, r8, r13, r9, r6

  POP r31
  RET

; === HUD: signed fixed-point to string ===
; Converts r22 (signed 4.12 fixed-point) to decimal string at r25
; Format: [-]X.XXX (3 fractional digits)
; Advances r25 past the written characters
; Clobbers: r0-r10
hud_fixed_to_str:
  PUSH r31
  ; Check sign
  LDI r11, 0x80000000
  MOV r0, r22
  AND r0, r11
  JZ r0, hfs_positive
  ; Negative: write '-', negate value
  LDI r11, 45
  STORE r25, r11
  ADD r25, r12
  NEG r22
hfs_positive:
  ; Integer part = r22 >> 12 (arithmetic shift for sign)
  MOV r0, r22
  SAR r0, r18        ; r0 = integer part (signed)
  ; Write integer part using itoa-style (inline for simplicity)
  ; Handle negative display: since we already negated, r0 >= 0
  CALL hud_write_u32
  ; Decimal point
  LDI r11, 46
  STORE r25, r11
  ADD r25, r12
  ; Fractional part: (r22 & 0xFFF) * 1000 / 4096
  MOV r0, r22
  LDI r11, 0xFFF
  AND r0, r11         ; r0 = fractional bits (0-4095)
  LDI r11, 1000
  MUL r0, r11         ; r0 = frac * 1000
  LDI r11, 4096
  DIV r0, r11         ; r0 = 3-digit fraction (0-999)
  ; Write 3 digits, zero-padded
  ; Hundreds digit
  LDI r11, 100
  MOV r2, r0
  DIV r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  ; Tens digit
  MOV r2, r0
  LDI r11, 100
  MOD r2, r11
  LDI r11, 10
  DIV r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  ; Units digit
  MOV r2, r0
  LDI r11, 10
  MOD r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  POP r31
  RET

; === HUD: unsigned fixed-point to string ===
; Same as hud_fixed_to_str but no sign handling (always positive)
hud_ufixed_to_str:
  PUSH r31
  MOV r0, r22
  SAR r0, r18        ; integer part
  CALL hud_write_u32
  LDI r11, 46
  STORE r25, r11
  ADD r25, r12
  MOV r0, r22
  LDI r11, 0xFFF
  AND r0, r11
  LDI r11, 1000
  MUL r0, r11
  LDI r11, 4096
  DIV r0, r11
  ; Hundreds
  LDI r11, 100
  MOV r2, r0
  DIV r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  ; Tens
  MOV r2, r0
  LDI r11, 100
  MOD r2, r11
  LDI r11, 10
  DIV r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  ; Units
  MOV r2, r0
  LDI r11, 10
  MOD r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r25, r2
  ADD r25, r12
  POP r31
  RET

; === HUD: write unsigned 32-bit integer as decimal to r25 ===
; r0 = value (unsigned), r25 = write pointer
; Advances r25 past written digits
; Clobbers: r0-r10
hud_write_u32:
  PUSH r31
  PUSH r3
  PUSH r8
  PUSH r13
  ; Special case: 0
  LDI r11, 0
  CMP r0, r11
  JNZ r15, hwu_nonzero
  LDI r11, 48
  STORE r25, r11
  ADD r25, r12
  JMP hwu_done
hwu_nonzero:
  ; Write digits in reverse to temp buffer at 0x5300
  LDI r3, 0x5300    ; temp buffer
  LDI r8, 0         ; digit count
hwu_div_loop:
  LDI r11, 0
  CMP r0, r11
  JZ r15, hwu_flush
  LDI r11, 10
  MOV r2, r0
  MOD r2, r11
  LDI r11, 48
  ADD r2, r11
  STORE r3, r2
  ADD r3, r12
  ADD r8, r12
  LDI r11, 10
  DIV r0, r11
  JMP hwu_div_loop
hwu_flush:
  ; Reverse: write digits from end to start
  SUB r3, r12       ; point to last digit written
hwu_copy_loop:
  LDI r11, 0
  CMP r8, r11
  JZ r15, hwu_done
  LOAD r11, r3
  STORE r25, r11
  ADD r25, r12
  SUB r3, r12
  SUB r8, r12
  JMP hwu_copy_loop
hwu_done:
  POP r13
  POP r8
  POP r3
  POP r31
  RET
