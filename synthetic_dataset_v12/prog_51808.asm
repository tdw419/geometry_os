; DESCRIPTION: Renders a orange line between points (98, 2) and (457, 178).
; PLAN: r0=98(x1), r1=2(y1), r2=457(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 2
LDI r2, 457
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
