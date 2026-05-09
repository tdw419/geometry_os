; DESCRIPTION: Draws a purple line from (349, 158) to (82, 103).
; PLAN: r0=349(x1), r1=158(y1), r2=82(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 158
LDI r2, 82
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
