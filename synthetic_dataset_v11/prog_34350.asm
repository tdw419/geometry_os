; DESCRIPTION: Places a purple circle of radius 71 at center (83, 146).
; PLAN: r0=83(x), r1=146(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 146
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
