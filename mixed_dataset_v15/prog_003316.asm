; DESCRIPTION: Renders a black line between points (320, 158) and (376, 99).
; PLAN: r0=320(x1), r1=158(y1), r2=376(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 158
LDI r2, 376
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
