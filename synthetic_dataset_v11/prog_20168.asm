; DESCRIPTION: Draws a purple line from (43, 163) to (116, 32).
; PLAN: r0=43(x1), r1=163(y1), r2=116(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 163
LDI r2, 116
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
