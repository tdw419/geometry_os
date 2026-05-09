; DESCRIPTION: Renders a purple line between points (194, 166) and (54, 97).
; PLAN: r0=194(x1), r1=166(y1), r2=54(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 166
LDI r2, 54
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
