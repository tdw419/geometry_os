; DESCRIPTION: Places a magenta line segment connecting (56, 250) to (110, 176).
; PLAN: r0=56(x1), r1=250(y1), r2=110(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 250
LDI r2, 110
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
