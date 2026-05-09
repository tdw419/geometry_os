; DESCRIPTION: Draws a blue line from (142, 198) to (92, 199).
; PLAN: r0=142(x1), r1=198(y1), r2=92(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 198
LDI r2, 92
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
