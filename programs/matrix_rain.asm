; matrix_rain.asm -- Matrix digital rain effect
;
; Falling columns of random characters with bright green heads
; and dim green trails on a black background.
;
; Algorithm:
;   - 12 columns with independent x, y, speed, and character
;   - Each frame: clear to black, update positions, draw head + trail
;   - Columns reset to top with new random values when they fall off screen
;   - Random characters generated via RAND opcode
;
; RAM Layout:
;   0x2000..0x202F: column state pool (12 cols x 4 words)
;     word 0: x position
;     word 1: y position
;     word 2: speed (1 or 2)
;     word 3: ASCII character code
;   0x2100..0x2117: head char strings (12 x 2 words: char, 0)
;   0x2200..0x2217: trail char strings (12 x 2 words: char, 0)

; === Constants ===
LDI r7, 1
LDI r10, 12
LDI r11, 0x2000
LDI r12, 0x2100
LDI r13, 0x2200
LDI r14, 0x00FF00
LDI r15, 0x004400
LDI r16, 0
LDI r17, 250
LDI r18, 240
LDI r19, 0x5D
LDI r20, 0x21
LDI r21, 10

; === Initialize column pool ===
LDI r1, 0
init_loop:
  MOV r2, r1
  SHL r2, r7
  SHL r2, r7
  ADD r2, r11

  RAND r3
  AND r3, r17
  STORE r2, r3

  ADD r2, r7
  LDI r3, 0
  STORE r2, r3

  ADD r2, r7
  RAND r3
  AND r3, r7
  ADD r3, r7
  STORE r2, r3

  ADD r2, r7
  RAND r3
  AND r3, r19
  ADD r3, r20
  STORE r2, r3

  ADD r1, r7
  CMP r1, r10
  BLT r0, init_loop

; === Main animation loop ===
frame_loop:
  LDI r30, 0
  FILL r30

  LDI r1, 0
update_loop:
  ; Load column state
  MOV r2, r1
  SHL r2, r7
  SHL r2, r7
  ADD r2, r11

  LOAD r3, r2
  ADD r2, r7
  LOAD r4, r2
  ADD r2, r7
  LOAD r5, r2
  ADD r2, r7
  LOAD r6, r2

  ; Update y
  ADD r4, r5

  ; Reset if off bottom
  CMP r4, r18
  BLT r0, y_ok
  LDI r4, 0
  RAND r3
  AND r3, r17
  RAND r5
  AND r5, r7
  ADD r5, r7
  RAND r6
  AND r6, r19
  ADD r6, r20
y_ok:

  ; Store updated state
  MOV r2, r1
  SHL r2, r7
  SHL r2, r7
  ADD r2, r11
  STORE r2, r3
  ADD r2, r7
  STORE r2, r4
  ADD r2, r7
  STORE r2, r5
  ADD r2, r7
  STORE r2, r6

  ; Write head char to head string buffer
  MOV r8, r1
  SHL r8, r7
  ADD r8, r12
  STORE r8, r6
  ADD r8, r7
  LDI r9, 0
  STORE r8, r9
  SUB r8, r7

  ; Draw head (bright green)
  MOV r22, r3
  MOV r23, r4
  MOV r24, r8
  MOV r25, r14
  MOV r26, r16
  DRAWTEXT r22, r23, r24, r25, r26

  ; Draw trail (dim green) if y >= 10
  MOV r9, r4
  SUB r9, r21
  CMP r4, r21
  BLT r0, no_trail

  MOV r27, r6
  LDI r28, 3
  XOR r27, r28
  MOV r8, r1
  SHL r8, r7
  ADD r8, r13
  STORE r8, r27
  ADD r8, r7
  LDI r28, 0
  STORE r8, r28
  SUB r8, r7

  MOV r22, r3
  MOV r23, r9
  MOV r24, r8
  MOV r25, r15
  DRAWTEXT r22, r23, r24, r25, r26
no_trail:

  ADD r1, r7
  CMP r1, r10
  BLT r0, update_loop

  FRAME
  JMP frame_loop
