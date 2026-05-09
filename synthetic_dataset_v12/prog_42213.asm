; DESCRIPTION: Draws a purple line from (237, 136) to (75, 12).
; PLAN: r0=237(x1), r1=136(y1), r2=75(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 136
LDI r2, 75
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
