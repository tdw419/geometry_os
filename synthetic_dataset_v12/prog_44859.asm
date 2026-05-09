; DESCRIPTION: Draws a purple line from (156, 253) to (6, 140).
; PLAN: r0=156(x1), r1=253(y1), r2=6(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 253
LDI r2, 6
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
