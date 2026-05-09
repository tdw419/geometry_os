; DESCRIPTION: Places a magenta line segment connecting (289, 5) to (13, 145).
; PLAN: r0=289(x1), r1=5(y1), r2=13(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 5
LDI r2, 13
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
