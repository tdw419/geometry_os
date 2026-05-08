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
;   r7 = TICKS value (number to convert)
;   r8 = digit extractor (temp copy)
;   r10 = divisor (10)
;   r14 = ASCII '0' offset
;   r5 = current canvas address
;   r4 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r11  = loop counter
;   r6  = temp for comparisons

  LDI r10, 10          ; divisor for decimal extraction
  LDI r14, 0x30        ; ASCII '0'
  LDI r4, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r11, 0xFFE
  LOAD r7, r11         ; r7 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r5, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r7 % 10
  MOV r8, r7
  MOD r8, r10         ; r8 = ones digit (0-9)
  ADD r8, r14         ; convert to ASCII
  STORE r5, r8       ; write to canvas col 3
  SUB r5, r4         ; move left to col 2

  ; Extract tens digit: (r7 / 10) % 10
  MOV r8, r7
  DIV r8, r10         ; r8 = r7 / 10
  MOV r18, r8         ; save quotient
  MOD r8, r10         ; r8 = tens digit (0-9)
  ADD r8, r14         ; convert to ASCII
  STORE r5, r8       ; write to canvas col 2
  SUB r5, r4         ; move left to col 1

  ; Extract hundreds digit: (r7 / 100) % 10
  MOV r8, r18         ; restore r7/10
  DIV r8, r10         ; r8 = r7 / 100
  MOV r18, r8         ; save quotient
  MOD r8, r10         ; r8 = hundreds digit (0-9)
  ADD r8, r14         ; convert to ASCII
  STORE r5, r8       ; write to canvas col 1
  SUB r5, r4         ; move left to col 0

  ; Extract thousands digit: (r7 / 1000) % 10
  MOV r8, r18         ; restore r7/100
  DIV r8, r10         ; r8 = r7 / 1000
  MOD r8, r10         ; r8 = thousands digit (0-9)
  ADD r8, r14         ; convert to ASCII
  STORE r5, r8       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
