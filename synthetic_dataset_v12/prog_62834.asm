; DESCRIPTION: Draws a blue line from (503, 25) to (142, 217).
; PLAN: r0=503(x1), r1=25(y1), r2=142(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 25
LDI r2, 142
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
