; DESCRIPTION: Draws a purple line from (373, 156) to (382, 100).
; PLAN: r0=373(x1), r1=156(y1), r2=382(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 156
LDI r2, 382
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
