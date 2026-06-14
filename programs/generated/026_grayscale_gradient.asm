; GRAYSCALE GRADIENT -- Horizontal gradient from black (left) to white (right)
; Each column x gets color = x * 0x010101 = 0xRRGGBB where R=G=B=x

LDI r0, 0            ; r0 = x counter
LDI r1, 1            ; increment
LDI r2, 256          ; limit
LDI r3, 0x010101     ; grayscale multiplier

x_loop:
  LDI r4, 0          ; r4 = y counter

y_loop:
  ; Compute grayscale color: r5 = x * 0x010101
  LDI r5, 0
  ADD r5, r0         ; r5 = x
  MUL r5, r3         ; r5 = x * 0x010101

  PSET r0, r4, r5    ; pixel at (x, y) with grayscale color

  ; y++
  ADD r4, r1
  ; if y == 256, next x
  LDI r5, 0
  ADD r5, r4
  SUB r5, r2
  JZ r5, next_x
  JMP y_loop

next_x:
  ; x++
  ADD r0, r1
  ; if x == 256, done
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP x_loop

done:
HALT
