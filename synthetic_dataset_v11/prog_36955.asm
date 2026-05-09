; DESCRIPTION: Creates a black circular shape at (212, 131) with radius 37.
; PLAN: r0=212(x), r1=131(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 131
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
