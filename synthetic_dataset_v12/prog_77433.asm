; DESCRIPTION: Draws a purple line from (447, 176) to (148, 65).
; PLAN: r0=447(x1), r1=176(y1), r2=148(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 176
LDI r2, 148
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
