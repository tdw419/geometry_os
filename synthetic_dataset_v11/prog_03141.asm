; DESCRIPTION: Renders a purple line between points (126, 11) and (221, 245).
; PLAN: r0=126(x1), r1=11(y1), r2=221(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 11
LDI r2, 221
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
