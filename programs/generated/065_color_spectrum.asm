; COLOR SPECTRUM -- vertical rainbow gradient bar on dark background
; Left half: vertical gradient cycling through R, G, B
; Right half: horizontal gradient with color shifting
; Full screen coverage with colorful patterns

LDI r0, 0            ; r0 = y
LDI r1, 1            ; increment
LDI r2, 256          ; limit

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  ; Red channel: (x * 3 + y * 5) & 0xFF
  LDI r5, 0
  ADD r5, r4
  LDI r6, 3
  MUL r5, r6
  LDI r6, 0
  ADD r6, r0
  LDI r7, 5
  MUL r6, r7
  ADD r5, r6
  LDI r6, 0xFF
  AND r5, r6

  ; Green channel: (x * 7 + y * 3) & 0xFF
  LDI r8, 0
  ADD r8, r4
  LDI r6, 7
  MUL r8, r6
  LDI r6, 0
  ADD r6, r0
  LDI r7, 3
  MUL r6, r7
  ADD r8, r6
  LDI r6, 0xFF
  AND r8, r6

  ; Blue channel: (x * 5 + y * 7) & 0xFF
  LDI r9, 0
  ADD r9, r4
  LDI r6, 5
  MUL r9, r6
  LDI r6, 0
  ADD r6, r0
  LDI r7, 7
  MUL r6, r7
  ADD r9, r6
  LDI r6, 0xFF
  AND r9, r6

  ; Combine: color = (R << 16) | (G << 8) | B
  LDI r6, 0
  ADD r6, r5
  LDI r7, 8
  SHL r6, r7
  ADD r6, r8
  LDI r7, 8
  SHL r6, r7
  ADD r6, r9

  PSET r4, r0, r6

  ; x++
  LDI r7, 1
  ADD r4, r7
  LDI r5, 0
  ADD r5, r4
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ADD r0, r1
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
