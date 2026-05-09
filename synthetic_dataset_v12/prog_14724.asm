; DESCRIPTION: Places a blue circle of radius 18 at center (315, 94).
; PLAN: r0=315(x), r1=94(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 94
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
