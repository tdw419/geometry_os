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
;   r15 = TICKS value (number to convert)
;   r7 = digit extractor (temp copy)
;   r0 = divisor (10)
;   r1 = ASCII '0' offset
;   r3 = current canvas address
;   r5 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r11  = loop counter
;   r8  = temp for comparisons

  LDI r0, 10          ; divisor for decimal extraction
  LDI r1, 0x30        ; ASCII '0'
  LDI r5, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r11, 0xFFE
  LOAD r15, r11         ; r15 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r3, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r15 % 10
  MOV r7, r15
  MOD r7, r0         ; r7 = ones digit (0-9)
  ADD r7, r1         ; convert to ASCII
  STORE r3, r7       ; write to canvas col 3
  SUB r3, r5         ; move left to col 2

  ; Extract tens digit: (r15 / 10) % 10
  MOV r7, r15
  DIV r7, r0         ; r7 = r15 / 10
  MOV r18, r7         ; save quotient
  MOD r7, r0         ; r7 = tens digit (0-9)
  ADD r7, r1         ; convert to ASCII
  STORE r3, r7       ; write to canvas col 2
  SUB r3, r5         ; move left to col 1

  ; Extract hundreds digit: (r15 / 100) % 10
  MOV r7, r18         ; restore r15/10
  DIV r7, r0         ; r7 = r15 / 100
  MOV r18, r7         ; save quotient
  MOD r7, r0         ; r7 = hundreds digit (0-9)
  ADD r7, r1         ; convert to ASCII
  STORE r3, r7       ; write to canvas col 1
  SUB r3, r5         ; move left to col 0

  ; Extract thousands digit: (r15 / 1000) % 10
  MOV r7, r18         ; restore r15/100
  DIV r7, r0         ; r7 = r15 / 1000
  MOD r7, r0         ; r7 = thousands digit (0-9)
  ADD r7, r1         ; convert to ASCII
  STORE r3, r7       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
