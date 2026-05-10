; DESCRIPTION: Renders a orange line segment connecting (212, 192) to (72, 26).
; PLAN: r0=212(x1), r1=192(y1), r2=72(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 192
LDI r2, 72
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
