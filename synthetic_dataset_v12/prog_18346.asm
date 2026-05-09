; DESCRIPTION: Places a blue line segment connecting (385, 73) to (107, 163).
; PLAN: r0=385(x1), r1=73(y1), r2=107(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 73
LDI r2, 107
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
