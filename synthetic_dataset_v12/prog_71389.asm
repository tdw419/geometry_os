; DESCRIPTION: Places a blue circle of radius 70 at center (83, 82).
; PLAN: r0=83(x), r1=82(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 82
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
