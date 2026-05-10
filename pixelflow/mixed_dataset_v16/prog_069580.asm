; DESCRIPTION: Places a purple circle of radius 47 at center (335, 76).
; PLAN: r0=335(x), r1=76(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 76
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
