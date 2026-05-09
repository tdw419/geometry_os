; DESCRIPTION: Renders a orange line between points (2, 83) and (177, 206).
; PLAN: r0=2(x1), r1=83(y1), r2=177(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 83
LDI r2, 177
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
