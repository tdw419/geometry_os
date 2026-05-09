; DESCRIPTION: Renders a black line between points (107, 64) and (62, 245).
; PLAN: r0=107(x1), r1=64(y1), r2=62(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 64
LDI r2, 62
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
