; DESCRIPTION: Places a blue line segment connecting (293, 175) to (109, 84).
; PLAN: r0=293(x1), r1=175(y1), r2=109(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 175
LDI r2, 109
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
