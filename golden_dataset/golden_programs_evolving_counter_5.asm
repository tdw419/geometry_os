; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r12 = TICKS value (number to convert)
;   r13 = digit extractor (temp copy)
;   r15 = divisor (10)
;   r6 = ASCII '0' offset
;   r3 = current canvas address
;   r5 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r2  = loop counter
;   r8  = temp for comparisons

  LDI r15, 10          ; divisor for decimal extraction
  LDI r6, 0x30        ; ASCII '0'
  LDI r5, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r2, 0xFFE
  LOAD r12, r2         ; r12 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r3, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r12 % 10
  MOV r13, r12
  MOD r13, r15         ; r13 = ones digit (0-9)
  ADD r13, r6         ; convert to ASCII
  STORE r3, r13       ; write to canvas col 3
  SUB r3, r5         ; move left to col 2

  ; Extract tens digit: (r12 / 10) % 10
  MOV r13, r12
  DIV r13, r15         ; r13 = r12 / 10
  MOV r18, r13         ; save quotient
  MOD r13, r15         ; r13 = tens digit (0-9)
  ADD r13, r6         ; convert to ASCII
  STORE r3, r13       ; write to canvas col 2
  SUB r3, r5         ; move left to col 1

  ; Extract hundreds digit: (r12 / 100) % 10
  MOV r13, r18         ; restore r12/10
  DIV r13, r15         ; r13 = r12 / 100
  MOV r18, r13         ; save quotient
  MOD r13, r15         ; r13 = hundreds digit (0-9)
  ADD r13, r6         ; convert to ASCII
  STORE r3, r13       ; write to canvas col 1
  SUB r3, r5         ; move left to col 0

  ; Extract thousands digit: (r12 / 1000) % 10
  MOV r13, r18         ; restore r12/100
  DIV r13, r15         ; r13 = r12 / 1000
  MOD r13, r15         ; r13 = thousands digit (0-9)
  ADD r13, r6         ; convert to ASCII
  STORE r3, r13       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
