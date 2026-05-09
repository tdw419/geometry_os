; DESCRIPTION: Places a blue line segment connecting (414, 93) to (104, 175).
; PLAN: r0=414(x1), r1=93(y1), r2=104(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 93
LDI r2, 104
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
