; DESCRIPTION: Draws a blue line from (145, 63) to (155, 95).
; PLAN: r0=145(x1), r1=63(y1), r2=155(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 63
LDI r2, 155
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
