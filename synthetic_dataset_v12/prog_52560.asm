; DESCRIPTION: Renders a orange line between points (231, 88) and (9, 20).
; PLAN: r0=231(x1), r1=88(y1), r2=9(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 88
LDI r2, 9
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
