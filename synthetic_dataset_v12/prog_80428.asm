; DESCRIPTION: Places a blue line segment connecting (384, 66) to (377, 73).
; PLAN: r0=384(x1), r1=66(y1), r2=377(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 66
LDI r2, 377
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
