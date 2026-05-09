; DESCRIPTION: Places a magenta line segment connecting (83, 240) to (272, 240).
; PLAN: r0=83(x1), r1=240(y1), r2=272(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 240
LDI r2, 272
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
