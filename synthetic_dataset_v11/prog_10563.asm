; DESCRIPTION: Draws a purple line from (136, 236) to (109, 133).
; PLAN: r0=136(x1), r1=236(y1), r2=109(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 236
LDI r2, 109
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
