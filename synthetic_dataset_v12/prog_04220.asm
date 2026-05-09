; DESCRIPTION: Renders a orange line between points (357, 236) and (158, 8).
; PLAN: r0=357(x1), r1=236(y1), r2=158(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 236
LDI r2, 158
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
