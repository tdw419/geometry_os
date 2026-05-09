; DESCRIPTION: Draws a blue line from (316, 74) to (139, 157).
; PLAN: r0=316(x1), r1=74(y1), r2=139(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 74
LDI r2, 139
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
