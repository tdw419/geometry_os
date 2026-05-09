; DESCRIPTION: Places a magenta line segment connecting (2, 226) to (324, 239).
; PLAN: r0=2(x1), r1=226(y1), r2=324(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 226
LDI r2, 324
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
