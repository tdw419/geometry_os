; DESCRIPTION: Places a blue line segment connecting (11, 189) to (377, 197).
; PLAN: r0=11(x1), r1=189(y1), r2=377(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 189
LDI r2, 377
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
