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
;   r1 = TICKS value (number to convert)
;   r12 = digit extractor (temp copy)
;   r10 = divisor (10)
;   r0 = ASCII '0' offset
;   r11 = current canvas address
;   r7 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r5  = loop counter
;   r8  = temp for comparisons

  LDI r10, 10          ; divisor for decimal extraction
  LDI r0, 0x30        ; ASCII '0'
  LDI r7, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r5, 0xFFE
  LOAD r1, r5         ; r1 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r11, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r1 % 10
  MOV r12, r1
  MOD r12, r10         ; r12 = ones digit (0-9)
  ADD r12, r0         ; convert to ASCII
  STORE r11, r12       ; write to canvas col 3
  SUB r11, r7         ; move left to col 2

  ; Extract tens digit: (r1 / 10) % 10
  MOV r12, r1
  DIV r12, r10         ; r12 = r1 / 10
  MOV r18, r12         ; save quotient
  MOD r12, r10         ; r12 = tens digit (0-9)
  ADD r12, r0         ; convert to ASCII
  STORE r11, r12       ; write to canvas col 2
  SUB r11, r7         ; move left to col 1

  ; Extract hundreds digit: (r1 / 100) % 10
  MOV r12, r18         ; restore r1/10
  DIV r12, r10         ; r12 = r1 / 100
  MOV r18, r12         ; save quotient
  MOD r12, r10         ; r12 = hundreds digit (0-9)
  ADD r12, r0         ; convert to ASCII
  STORE r11, r12       ; write to canvas col 1
  SUB r11, r7         ; move left to col 0

  ; Extract thousands digit: (r1 / 1000) % 10
  MOV r12, r18         ; restore r1/100
  DIV r12, r10         ; r12 = r1 / 1000
  MOD r12, r10         ; r12 = thousands digit (0-9)
  ADD r12, r0         ; convert to ASCII
  STORE r11, r12       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
