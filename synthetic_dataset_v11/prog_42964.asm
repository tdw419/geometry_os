; DESCRIPTION: Renders a orange line between points (2, 99) and (251, 255).
; PLAN: r0=2(x1), r1=99(y1), r2=251(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 99
LDI r2, 251
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
