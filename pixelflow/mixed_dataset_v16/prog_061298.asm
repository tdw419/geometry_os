; DESCRIPTION: Places a blue circle of radius 78 at center (335, 149).
; PLAN: r0=335(x), r1=149(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 149
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
