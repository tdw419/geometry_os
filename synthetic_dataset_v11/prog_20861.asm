; DESCRIPTION: Renders a orange line between points (252, 99) and (81, 43).
; PLAN: r0=252(x1), r1=99(y1), r2=81(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 99
LDI r2, 81
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
