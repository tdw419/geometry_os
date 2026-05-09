; DESCRIPTION: Places a blue line segment connecting (282, 133) to (486, 144).
; PLAN: r0=282(x1), r1=133(y1), r2=486(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 133
LDI r2, 486
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
