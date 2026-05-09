; DESCRIPTION: Draws a purple line from (181, 134) to (122, 34).
; PLAN: r0=181(x1), r1=134(y1), r2=122(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 134
LDI r2, 122
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
