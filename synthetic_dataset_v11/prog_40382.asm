; DESCRIPTION: Draws a purple line from (59, 35) to (148, 133).
; PLAN: r0=59(x1), r1=35(y1), r2=148(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 35
LDI r2, 148
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
