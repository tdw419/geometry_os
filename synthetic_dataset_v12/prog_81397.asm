; DESCRIPTION: Renders a purple line between points (4, 245) and (232, 42).
; PLAN: r0=4(x1), r1=245(y1), r2=232(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 245
LDI r2, 232
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
