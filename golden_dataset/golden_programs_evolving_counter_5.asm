; DESCRIPTION: The assembly code reads a frame count from memory, converts it into four decimal digits, and writes these digits to a canvas buffer. The canvas is then displayed as a live dashboard showing the evolving frame counter in real-time.

; evolving_counter.asm
; Pixel-Driving-Pixels Demo: A live frame counter on the canvas grid.
;
; HOW IT WORKS:
; 1. Each frame, reads TICKS from RAM[0xFFE]
; 2. Converts the count to 4 decimal ASCII digits (0000-9999)
; 3. Writes the digits to canvas buffer at 0x8000 (row 0, cols 0-3)
; 4. The grid becomes a live dashboard -- digits visibly change each frame
;
; The count digits ARE the program's visible state. No separate output.
; This demonstrates that the grid IS the display.
;
; Register usage:
;   r11 = TICKS value (number to convert)
;   r2 = digit extractor (temp copy)
;   r14 = divisor (10)
;   r15 = ASCII '0' offset
;   r4 = current canvas address
;   r8 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r3  = loop counter
;   r1  = temp for comparisons

  LDI r14, 10          ; divisor for decimal extraction
  LDI r15, 0x30        ; ASCII '0'
  LDI r8, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r3, 0xFFE
  LOAD r11, r3         ; r11 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r4, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r11 % 10
  MOV r2, r11
  MOD r2, r14         ; r2 = ones digit (0-9)
  ADD r2, r15         ; convert to ASCII
  STORE r4, r2       ; write to canvas col 3
  SUB r4, r8         ; move left to col 2

  ; Extract tens digit: (r11 / 10) % 10
  MOV r2, r11
  DIV r2, r14         ; r2 = r11 / 10
  MOV r18, r2         ; save quotient
  MOD r2, r14         ; r2 = tens digit (0-9)
  ADD r2, r15         ; convert to ASCII
  STORE r4, r2       ; write to canvas col 2
  SUB r4, r8         ; move left to col 1

  ; Extract hundreds digit: (r11 / 100) % 10
  MOV r2, r18         ; restore r11/10
  DIV r2, r14         ; r2 = r11 / 100
  MOV r18, r2         ; save quotient
  MOD r2, r14         ; r2 = hundreds digit (0-9)
  ADD r2, r15         ; convert to ASCII
  STORE r4, r2       ; write to canvas col 1
  SUB r4, r8         ; move left to col 0

  ; Extract thousands digit: (r11 / 1000) % 10
  MOV r2, r18         ; restore r11/100
  DIV r2, r14         ; r2 = r11 / 1000
  MOD r2, r14         ; r2 = thousands digit (0-9)
  ADD r2, r15         ; convert to ASCII
  STORE r4, r2       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
