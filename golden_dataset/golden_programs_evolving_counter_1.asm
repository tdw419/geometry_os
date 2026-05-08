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
;   r3 = TICKS value (number to convert)
;   r13 = digit extractor (temp copy)
;   r11 = divisor (10)
;   r10 = ASCII '0' offset
;   r7 = current canvas address
;   r9 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r6  = loop counter
;   r15  = temp for comparisons

  LDI r11, 10          ; divisor for decimal extraction
  LDI r10, 0x30        ; ASCII '0'
  LDI r9, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r6, 0xFFE
  LOAD r3, r6         ; r3 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r7, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r3 % 10
  MOV r13, r3
  MOD r13, r11         ; r13 = ones digit (0-9)
  ADD r13, r10         ; convert to ASCII
  STORE r7, r13       ; write to canvas col 3
  SUB r7, r9         ; move left to col 2

  ; Extract tens digit: (r3 / 10) % 10
  MOV r13, r3
  DIV r13, r11         ; r13 = r3 / 10
  MOV r18, r13         ; save quotient
  MOD r13, r11         ; r13 = tens digit (0-9)
  ADD r13, r10         ; convert to ASCII
  STORE r7, r13       ; write to canvas col 2
  SUB r7, r9         ; move left to col 1

  ; Extract hundreds digit: (r3 / 100) % 10
  MOV r13, r18         ; restore r3/10
  DIV r13, r11         ; r13 = r3 / 100
  MOV r18, r13         ; save quotient
  MOD r13, r11         ; r13 = hundreds digit (0-9)
  ADD r13, r10         ; convert to ASCII
  STORE r7, r13       ; write to canvas col 1
  SUB r7, r9         ; move left to col 0

  ; Extract thousands digit: (r3 / 1000) % 10
  MOV r13, r18         ; restore r3/100
  DIV r13, r11         ; r13 = r3 / 1000
  MOD r13, r11         ; r13 = thousands digit (0-9)
  ADD r13, r10         ; convert to ASCII
  STORE r7, r13       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
