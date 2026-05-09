; DESCRIPTION: Renders a purple line between points (278, 95) and (275, 245).
; PLAN: r0=278(x1), r1=95(y1), r2=275(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 95
LDI r2, 275
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
