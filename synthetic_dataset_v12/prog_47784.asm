; DESCRIPTION: Draws a purple line from (40, 38) to (358, 246).
; PLAN: r0=40(x1), r1=38(y1), r2=358(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 38
LDI r2, 358
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
