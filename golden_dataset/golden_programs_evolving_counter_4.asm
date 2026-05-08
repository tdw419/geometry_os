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
;   r4 = TICKS value (number to convert)
;   r3 = digit extractor (temp copy)
;   r2 = divisor (10)
;   r11 = ASCII '0' offset
;   r1 = current canvas address
;   r0 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r12  = loop counter
;   r8  = temp for comparisons

  LDI r2, 10          ; divisor for decimal extraction
  LDI r11, 0x30        ; ASCII '0'
  LDI r0, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r12, 0xFFE
  LOAD r4, r12         ; r4 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r1, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r4 % 10
  MOV r3, r4
  MOD r3, r2         ; r3 = ones digit (0-9)
  ADD r3, r11         ; convert to ASCII
  STORE r1, r3       ; write to canvas col 3
  SUB r1, r0         ; move left to col 2

  ; Extract tens digit: (r4 / 10) % 10
  MOV r3, r4
  DIV r3, r2         ; r3 = r4 / 10
  MOV r18, r3         ; save quotient
  MOD r3, r2         ; r3 = tens digit (0-9)
  ADD r3, r11         ; convert to ASCII
  STORE r1, r3       ; write to canvas col 2
  SUB r1, r0         ; move left to col 1

  ; Extract hundreds digit: (r4 / 100) % 10
  MOV r3, r18         ; restore r4/10
  DIV r3, r2         ; r3 = r4 / 100
  MOV r18, r3         ; save quotient
  MOD r3, r2         ; r3 = hundreds digit (0-9)
  ADD r3, r11         ; convert to ASCII
  STORE r1, r3       ; write to canvas col 1
  SUB r1, r0         ; move left to col 0

  ; Extract thousands digit: (r4 / 1000) % 10
  MOV r3, r18         ; restore r4/100
  DIV r3, r2         ; r3 = r4 / 1000
  MOD r3, r2         ; r3 = thousands digit (0-9)
  ADD r3, r11         ; convert to ASCII
  STORE r1, r3       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
