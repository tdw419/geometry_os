; DESCRIPTION: Places a yellow circle of radius 39 at center (83, 197).
; PLAN: r0=83(x), r1=197(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 197
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
