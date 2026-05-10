; DESCRIPTION: Renders a yellow line segment connecting (79, 62) to (6, 90).
; PLAN: r0=79(x1), r1=62(y1), r2=6(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 62
LDI r2, 6
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
