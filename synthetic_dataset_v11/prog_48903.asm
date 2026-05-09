; DESCRIPTION: Places a blue line segment connecting (133, 65) to (52, 114).
; PLAN: r0=133(x1), r1=65(y1), r2=52(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 65
LDI r2, 52
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
