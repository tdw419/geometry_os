; DESCRIPTION: Draws a blue line from (341, 133) to (287, 250).
; PLAN: r0=341(x1), r1=133(y1), r2=287(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 133
LDI r2, 287
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
