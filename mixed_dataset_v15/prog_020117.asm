; DESCRIPTION: Renders a orange line between points (282, 175) and (490, 133).
; PLAN: r0=282(x1), r1=175(y1), r2=490(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 175
LDI r2, 490
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
