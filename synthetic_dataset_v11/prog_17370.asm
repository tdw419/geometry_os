; DESCRIPTION: Renders a orange line between points (201, 132) and (57, 157).
; PLAN: r0=201(x1), r1=132(y1), r2=57(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 132
LDI r2, 57
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
