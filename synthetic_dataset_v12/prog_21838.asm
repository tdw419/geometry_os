; DESCRIPTION: Renders a purple line between points (130, 245) and (62, 101).
; PLAN: r0=130(x1), r1=245(y1), r2=62(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 245
LDI r2, 62
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
