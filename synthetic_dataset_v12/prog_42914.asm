; DESCRIPTION: Places a blue circle of radius 33 at center (366, 33).
; PLAN: r0=366(x), r1=33(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 33
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
