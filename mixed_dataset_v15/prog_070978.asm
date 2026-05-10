; DESCRIPTION: Places a blue line segment connecting (330, 70) to (396, 109).
; PLAN: r0=330(x1), r1=70(y1), r2=396(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 70
LDI r2, 396
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
