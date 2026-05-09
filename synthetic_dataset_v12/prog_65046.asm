; DESCRIPTION: Draws a blue line from (331, 155) to (414, 157).
; PLAN: r0=331(x1), r1=155(y1), r2=414(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 155
LDI r2, 414
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
