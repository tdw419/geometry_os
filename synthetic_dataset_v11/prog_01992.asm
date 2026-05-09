; DESCRIPTION: Places a magenta line segment connecting (128, 170) to (89, 174).
; PLAN: r0=128(x1), r1=170(y1), r2=89(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 170
LDI r2, 89
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
