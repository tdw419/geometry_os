; DESCRIPTION: Draws a blue line from (57, 133) to (145, 189).
; PLAN: r0=57(x1), r1=133(y1), r2=145(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 133
LDI r2, 145
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
