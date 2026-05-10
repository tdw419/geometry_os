; DESCRIPTION: Renders a orange line between points (490, 224) and (90, 106).
; PLAN: r0=490(x1), r1=224(y1), r2=90(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 224
LDI r2, 90
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
