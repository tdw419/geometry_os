; DESCRIPTION: Draws a purple line from (180, 58) to (38, 230).
; PLAN: r0=180(x1), r1=58(y1), r2=38(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 58
LDI r2, 38
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
