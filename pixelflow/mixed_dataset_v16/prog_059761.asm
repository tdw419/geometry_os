; DESCRIPTION: Draws a purple line from (92, 109) to (338, 248).
; PLAN: r0=92(x1), r1=109(y1), r2=338(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 109
LDI r2, 338
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
