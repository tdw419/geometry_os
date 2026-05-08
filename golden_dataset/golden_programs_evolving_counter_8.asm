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
;   r12 = TICKS value (number to convert)
;   r4 = digit extractor (temp copy)
;   r10 = divisor (10)
;   r0 = ASCII '0' offset
;   r11 = current canvas address
;   r13 = address increment
;   r16 = digit position (4,3,2,1 counting down)
;   r17 = digit value (0-9)
;   r18 = temp for division chain
;   r7  = loop counter
;   r5  = temp for comparisons

  LDI r10, 10          ; divisor for decimal extraction
  LDI r0, 0x30        ; ASCII '0'
  LDI r13, 1           ; address increment

main_loop:
  ; Read TICKS
  LDI r7, 0xFFE
  LOAD r12, r7         ; r12 = current frame count

  ; We extract 4 digits: thousands, hundreds, tens, ones
  ; Starting from the leftmost digit (most significant)
  ; Canvas address starts at 0x8000 (row 0, col 0)
  LDI r11, 0x8003      ; start at rightmost position (col 3)

  ; Extract ones digit: r12 % 10
  MOV r4, r12
  MOD r4, r10         ; r4 = ones digit (0-9)
  ADD r4, r0         ; convert to ASCII
  STORE r11, r4       ; write to canvas col 3
  SUB r11, r13         ; move left to col 2

  ; Extract tens digit: (r12 / 10) % 10
  MOV r4, r12
  DIV r4, r10         ; r4 = r12 / 10
  MOV r18, r4         ; save quotient
  MOD r4, r10         ; r4 = tens digit (0-9)
  ADD r4, r0         ; convert to ASCII
  STORE r11, r4       ; write to canvas col 2
  SUB r11, r13         ; move left to col 1

  ; Extract hundreds digit: (r12 / 100) % 10
  MOV r4, r18         ; restore r12/10
  DIV r4, r10         ; r4 = r12 / 100
  MOV r18, r4         ; save quotient
  MOD r4, r10         ; r4 = hundreds digit (0-9)
  ADD r4, r0         ; convert to ASCII
  STORE r11, r4       ; write to canvas col 1
  SUB r11, r13         ; move left to col 0

  ; Extract thousands digit: (r12 / 1000) % 10
  MOV r4, r18         ; restore r12/100
  DIV r4, r10         ; r4 = r12 / 1000
  MOD r4, r10         ; r4 = thousands digit (0-9)
  ADD r4, r0         ; convert to ASCII
  STORE r11, r4       ; write to canvas col 0

  FRAME                ; display this frame
  JMP main_loop        ; repeat forever
