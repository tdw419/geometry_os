; DESCRIPTION: Places a orange line segment connecting (417, 87) to (56, 134).
; PLAN: r0=417(x1), r1=87(y1), r2=56(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 87
LDI r2, 56
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
