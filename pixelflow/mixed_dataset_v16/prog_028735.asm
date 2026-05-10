; DESCRIPTION: Renders a orange line between points (64, 43) and (309, 88).
; PLAN: r0=64(x1), r1=43(y1), r2=309(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 43
LDI r2, 309
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
