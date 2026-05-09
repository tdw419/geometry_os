; DESCRIPTION: Renders a orange line between points (85, 209) and (484, 99).
; PLAN: r0=85(x1), r1=209(y1), r2=484(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 209
LDI r2, 484
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
