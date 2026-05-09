; DESCRIPTION: Renders a orange line between points (192, 99) and (134, 188).
; PLAN: r0=192(x1), r1=99(y1), r2=134(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 99
LDI r2, 134
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
