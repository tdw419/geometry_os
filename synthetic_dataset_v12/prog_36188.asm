; DESCRIPTION: Draws a purple line from (213, 14) to (64, 211).
; PLAN: r0=213(x1), r1=14(y1), r2=64(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 14
LDI r2, 64
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
