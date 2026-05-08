; DESCRIPTION: Display a object using color colored at the screen.

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
;   r9 = TICKS value (number to convert)
;   r7 = digit extractor (temp copy)
;   r12 = divisor (10)
;   r14 = ASCII '0' offset
;   r10 = current canvas address
;   r13 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r15  = loop counter
;   r4  = temp for comparisons

  LDI r12, 10          ; divisor for decimal extraction
  LDI r14, 0x30        ; ASCII '0'
  LDI r13, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r15, 0xFFE
  LOAD r9, r15         ; r9 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r10, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r9 % 10
  MOV r7, r9
  MOD r7, r12         ; r7 = ones digit (0-9)
  ADD r7, r14         ; convert to ASCII
  STORE r10, r7       ; write to canvas col 3
  SUB r10, r13         ; move left to col 2

  ; Extract tens digit: (r9 / 10) % 10
  MOV r7, r9
  DIV r7, r12         ; r7 = r9 / 10
  MOV r18, r7         ; save quotient
  MOD r7, r12         ; r7 = tens digit (0-9)
  ADD r7, r14         ; convert to ASCII
  STORE r10, r7       ; write to canvas col 2
  SUB r10, r13         ; move left to col 1

  ; Extract hundreds digit: (r9 / 100) % 10
  MOV r7, r18         ; restore r9/10
  DIV r7, r12         ; r7 = r9 / 100
  MOV r18, r7         ; save quotient
  MOD r7, r12         ; r7 = hundreds digit (0-9)
  ADD r7, r14         ; convert to ASCII
  STORE r10, r7       ; write to canvas col 1
  SUB r10, r13         ; move left to col 0

  ; Extract thousands digit: (r9 / 1000) % 10
  MOV r7, r18         ; restore r9/100
  DIV r7, r12         ; r7 = r9 / 1000
  MOD r7, r12         ; r7 = thousands digit (0-9)
  ADD r7, r14         ; convert to ASCII
  STORE r10, r7       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
