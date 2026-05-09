; DESCRIPTION: Renders a purple line between points (179, 166) and (212, 191).
; PLAN: r0=179(x1), r1=166(y1), r2=212(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 166
LDI r2, 212
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
