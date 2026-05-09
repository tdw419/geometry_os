; DESCRIPTION: Places a blue line segment connecting (49, 193) to (133, 57).
; PLAN: r0=49(x1), r1=193(y1), r2=133(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 193
LDI r2, 133
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
