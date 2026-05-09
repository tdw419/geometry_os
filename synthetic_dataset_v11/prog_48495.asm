; DESCRIPTION: Creates a green circular shape at (131, 100) with radius 78.
; PLAN: r0=131(x), r1=100(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 100
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
