; DESCRIPTION: Draws a purple line from (161, 240) to (74, 116).
; PLAN: r0=161(x1), r1=240(y1), r2=74(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 240
LDI r2, 74
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
