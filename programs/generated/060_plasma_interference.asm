; PLASMA_INTERFERENCE -- Colorful interference pattern
; R = (x*7 + y*13) & 0xFF, G = (x*3 + y*11) & 0xFF, B = (x*5 + y*7) & 0xFF

LDI r0, 0          ; r0 = y
LDI r2, 256        ; r2 = limit
LDI r3, 1          ; r3 = increment

y_loop:
  LDI r1, 0        ; r1 = x

x_loop:
  ; R channel: (x*7 + y*13) << 16
  LDI r4, 7
  LDI r5, 0
  ADD r5, r1
  MUL r4, r5       ; r4 = x*7
  LDI r5, 13
  LDI r6, 0
  ADD r6, r0
  MUL r5, r6       ; r5 = y*13
  ADD r4, r5       ; r4 = x*7 + y*13
  LDI r5, 0xFF
  AND r4, r5       ; r4 = R & 0xFF
  SHLI r4, 16      ; r4 = R << 16
  LDI r15, 0
  ADD r15, r4      ; r15 = color accumulator

  ; G channel: (x*3 + y*11) << 8
  LDI r4, 3
  LDI r5, 0
  ADD r5, r1
  MUL r4, r5       ; r4 = x*3
  LDI r5, 11
  LDI r6, 0
  ADD r6, r0
  MUL r5, r6       ; r5 = y*11
  ADD r4, r5       ; r4 = x*3 + y*11
  LDI r5, 0xFF
  AND r4, r5       ; r4 = G & 0xFF
  SHLI r4, 8       ; r4 = G << 8
  OR r15, r4       ; r15 |= G << 8

  ; B channel: (x*5 + y*7)
  LDI r4, 5
  LDI r5, 0
  ADD r5, r1
  MUL r4, r5       ; r4 = x*5
  LDI r5, 7
  LDI r6, 0
  ADD r6, r0
  MUL r5, r6       ; r5 = y*7
  ADD r4, r5       ; r4 = x*5 + y*7
  LDI r5, 0xFF
  AND r4, r5       ; r4 = B & 0xFF
  OR r15, r4       ; r15 |= B

  PSET r1, r0, r15

  ; x++
  ADD r1, r3
  LDI r5, 0
  ADD r5, r1
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ADD r0, r3
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
