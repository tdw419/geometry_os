; DESCRIPTION: Renders a orange line between points (6, 22) and (133, 172).
; PLAN: r0=6(x1), r1=22(y1), r2=133(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 22
LDI r2, 133
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
