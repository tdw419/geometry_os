; DESCRIPTION: Renders a orange line between points (162, 110) and (128, 77).
; PLAN: r0=162(x1), r1=110(y1), r2=128(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 110
LDI r2, 128
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
