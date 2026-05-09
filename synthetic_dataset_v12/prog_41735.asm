; DESCRIPTION: Draws a blue line from (82, 147) to (385, 135).
; PLAN: r0=82(x1), r1=147(y1), r2=385(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 147
LDI r2, 385
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
