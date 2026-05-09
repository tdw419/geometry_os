; DESCRIPTION: Draws a purple line from (71, 246) to (296, 120).
; PLAN: r0=71(x1), r1=246(y1), r2=296(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 246
LDI r2, 296
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
