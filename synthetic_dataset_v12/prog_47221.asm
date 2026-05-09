; DESCRIPTION: Draws a purple line from (253, 250) to (452, 71).
; PLAN: r0=253(x1), r1=250(y1), r2=452(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 250
LDI r2, 452
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
