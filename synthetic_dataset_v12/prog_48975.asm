; DESCRIPTION: Renders a purple line between points (490, 63) and (58, 212).
; PLAN: r0=490(x1), r1=63(y1), r2=58(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 63
LDI r2, 58
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
