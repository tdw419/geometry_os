; DESCRIPTION: Places a blue circle of radius 70 at center (331, 120).
; PLAN: r0=331(x), r1=120(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 120
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
