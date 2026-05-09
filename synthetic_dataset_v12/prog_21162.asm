; DESCRIPTION: Places a blue line segment connecting (375, 45) to (28, 24).
; PLAN: r0=375(x1), r1=45(y1), r2=28(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 45
LDI r2, 28
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
