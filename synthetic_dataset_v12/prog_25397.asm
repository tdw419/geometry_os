; DESCRIPTION: Places a magenta line segment connecting (1, 220) to (454, 125).
; PLAN: r0=1(x1), r1=220(y1), r2=454(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 220
LDI r2, 454
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
