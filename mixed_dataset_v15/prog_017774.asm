; DESCRIPTION: Places a blue line segment connecting (358, 12) to (101, 73).
; PLAN: r0=358(x1), r1=12(y1), r2=101(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 12
LDI r2, 101
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
