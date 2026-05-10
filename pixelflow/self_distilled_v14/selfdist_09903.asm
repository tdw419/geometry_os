; DESCRIPTION: Draws a purple line from (157, 122) to (275, 74).
; PLAN: r0=157(x1), r1=122(y1), r2=275(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 122
LDI r2, 275
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
