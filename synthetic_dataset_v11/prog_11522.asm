; DESCRIPTION: Draws a purple line from (97, 28) to (24, 167).
; PLAN: r0=97(x1), r1=28(y1), r2=24(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 28
LDI r2, 24
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
