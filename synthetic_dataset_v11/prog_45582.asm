; DESCRIPTION: Renders a orange line between points (26, 115) and (84, 206).
; PLAN: r0=26(x1), r1=115(y1), r2=84(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 115
LDI r2, 84
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
