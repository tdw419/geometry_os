; DESCRIPTION: Draws a purple line from (511, 230) to (136, 157).
; PLAN: r0=511(x1), r1=230(y1), r2=136(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 230
LDI r2, 136
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
