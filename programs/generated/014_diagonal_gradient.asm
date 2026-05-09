; DIAGONAL GRADIENT -- Color each pixel based on (x+y) position
; Creates a smooth diagonal gradient from black to white
; Tests: arithmetic in inner loop, PSET with computed color

LDI r0, 0            ; r0 = y
LDI r2, 256          ; r2 = screen limit

y_loop:
  LDI r1, 0          ; r1 = x

x_loop:
  ; color = (x + y) * 2, giving range 0..510
  LDI r5, 0
  ADD r5, r1
  ADD r5, r0          ; r5 = x + y

  ; Spread into RGB: use r5 for all 3 channels (grayscale)
  ; But multiply to get more range: color = (x+y) * 257
  ; Actually just use r5 directly as a 24-bit color (grayscale)
  LDI r6, 0
  ADD r6, r5          ; r6 = r5 (low byte = grayscale value)
  
  ; Build grayscale: shift r5 into red and green channels too
  LDI r7, 0
  ADD r7, r5          ; r7 = x+y
  LDI r8, 0x010101    ; multiplier to spread byte across R,G,B
  MUL r6, r7, r8      ; r6 = (x+y) * 0x010101 = grayscale

  PSET r1, r0, r6

  ; x++
  LDI r9, 1
  ADD r1, r9

  ; if x == 256, next y
  LDI r9, 0
  ADD r9, r1
  SUB r9, r2
  JZ r9, next_y
  JMP x_loop

next_y:
  ; y++
  LDI r9, 1
  ADD r0, r9

  ; if y == 256, done
  LDI r9, 0
  ADD r9, r0
  SUB r9, r2
  JZ r9, done
  JMP y_loop

done:
HALT
