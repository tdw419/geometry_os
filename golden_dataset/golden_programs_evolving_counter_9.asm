; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r4 = TICKS value (number to convert)
;   r5 = digit extractor (temp copy)
;   r10 = divisor (10)
;   r7 = ASCII '0' offset
;   r1 = current canvas address
;   r13 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r6  = loop counter
;   r0  = temp for comparisons

  LDI r10, 10          ; divisor for decimal extraction
  LDI r7, 0x30        ; ASCII '0'
  LDI r13, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r6, 0xFFE
  LOAD r4, r6         ; r4 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r1, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r4 % 10
  MOV r5, r4
  MOD r5, r10         ; r5 = ones digit (0-9)
  ADD r5, r7         ; convert to ASCII
  STORE r1, r5       ; write to canvas col 3
  SUB r1, r13         ; move left to col 2

  ; Extract tens digit: (r4 / 10) % 10
  MOV r5, r4
  DIV r5, r10         ; r5 = r4 / 10
  MOV r18, r5         ; save quotient
  MOD r5, r10         ; r5 = tens digit (0-9)
  ADD r5, r7         ; convert to ASCII
  STORE r1, r5       ; write to canvas col 2
  SUB r1, r13         ; move left to col 1

  ; Extract hundreds digit: (r4 / 100) % 10
  MOV r5, r18         ; restore r4/10
  DIV r5, r10         ; r5 = r4 / 100
  MOV r18, r5         ; save quotient
  MOD r5, r10         ; r5 = hundreds digit (0-9)
  ADD r5, r7         ; convert to ASCII
  STORE r1, r5       ; write to canvas col 1
  SUB r1, r13         ; move left to col 0

  ; Extract thousands digit: (r4 / 1000) % 10
  MOV r5, r18         ; restore r4/100
  DIV r5, r10         ; r5 = r4 / 1000
  MOD r5, r10         ; r5 = thousands digit (0-9)
  ADD r5, r7         ; convert to ASCII
  STORE r1, r5       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
