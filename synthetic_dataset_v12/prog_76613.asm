; DESCRIPTION: Draws a purple line from (176, 238) to (308, 112).
; PLAN: r0=176(x1), r1=238(y1), r2=308(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 238
LDI r2, 308
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
