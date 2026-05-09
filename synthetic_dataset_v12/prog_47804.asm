; DESCRIPTION: Renders a magenta line between points (381, 33) and (62, 110).
; PLAN: r0=381(x1), r1=33(y1), r2=62(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 33
LDI r2, 62
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
