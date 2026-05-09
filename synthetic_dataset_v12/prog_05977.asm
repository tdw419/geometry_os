; DESCRIPTION: Draws a blue line from (431, 176) to (185, 100).
; PLAN: r0=431(x1), r1=176(y1), r2=185(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 176
LDI r2, 185
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
