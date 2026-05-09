; DESCRIPTION: Renders a orange line between points (80, 4) and (439, 101).
; PLAN: r0=80(x1), r1=4(y1), r2=439(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 4
LDI r2, 439
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
