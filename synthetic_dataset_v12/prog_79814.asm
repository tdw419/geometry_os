; DESCRIPTION: Places a magenta line segment connecting (399, 170) to (253, 250).
; PLAN: r0=399(x1), r1=170(y1), r2=253(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 170
LDI r2, 253
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
