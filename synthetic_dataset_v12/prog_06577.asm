; DESCRIPTION: Renders a orange line between points (278, 76) and (259, 28).
; PLAN: r0=278(x1), r1=76(y1), r2=259(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 76
LDI r2, 259
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
