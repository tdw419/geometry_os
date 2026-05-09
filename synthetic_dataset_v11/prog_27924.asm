; DESCRIPTION: Places a blue line segment connecting (63, 115) to (19, 114).
; PLAN: r0=63(x1), r1=115(y1), r2=19(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 115
LDI r2, 19
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
