; DESCRIPTION: Renders a red line segment connecting (13, 43) to (26, 9).
; PLAN: r0=13(x1), r1=43(y1), r2=26(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 43
LDI r2, 26
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
