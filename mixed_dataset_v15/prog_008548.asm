; DESCRIPTION: Places a blue line segment connecting (35, 33) to (422, 175).
; PLAN: r0=35(x1), r1=33(y1), r2=422(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 33
LDI r2, 422
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
