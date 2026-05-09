; DESCRIPTION: Renders a orange line between points (270, 84) and (252, 71).
; PLAN: r0=270(x1), r1=84(y1), r2=252(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 84
LDI r2, 252
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
