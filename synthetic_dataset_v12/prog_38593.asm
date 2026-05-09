; DESCRIPTION: Renders a orange line between points (259, 183) and (35, 255).
; PLAN: r0=259(x1), r1=183(y1), r2=35(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 183
LDI r2, 35
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
