; DESCRIPTION: Draws a purple line from (135, 159) to (48, 230).
; PLAN: r0=135(x1), r1=159(y1), r2=48(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 159
LDI r2, 48
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
