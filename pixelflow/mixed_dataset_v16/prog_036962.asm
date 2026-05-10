; DESCRIPTION: Renders a orange line between points (192, 52) and (429, 22).
; PLAN: r0=192(x1), r1=52(y1), r2=429(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 52
LDI r2, 429
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
