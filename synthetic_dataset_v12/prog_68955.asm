; DESCRIPTION: Draws a blue line from (336, 213) to (316, 160).
; PLAN: r0=336(x1), r1=213(y1), r2=316(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 213
LDI r2, 316
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
