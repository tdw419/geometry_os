; DESCRIPTION: Places a blue line segment connecting (109, 94) to (133, 171).
; PLAN: r0=109(x1), r1=94(y1), r2=133(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 94
LDI r2, 133
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
