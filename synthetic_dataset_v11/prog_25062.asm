; DESCRIPTION: Places a blue line segment connecting (25, 181) to (184, 169).
; PLAN: r0=25(x1), r1=181(y1), r2=184(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 181
LDI r2, 184
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
