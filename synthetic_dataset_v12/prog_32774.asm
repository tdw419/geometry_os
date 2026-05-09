; DESCRIPTION: Places a blue line segment connecting (293, 233) to (435, 12).
; PLAN: r0=293(x1), r1=233(y1), r2=435(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 233
LDI r2, 435
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
