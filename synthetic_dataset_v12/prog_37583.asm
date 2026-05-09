; DESCRIPTION: Draws a black line from (158, 95) to (318, 255).
; PLAN: r0=158(x1), r1=95(y1), r2=318(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 95
LDI r2, 318
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
