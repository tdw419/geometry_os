; DESCRIPTION: Draws a purple line from (88, 233) to (161, 230).
; PLAN: r0=88(x1), r1=233(y1), r2=161(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 233
LDI r2, 161
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
