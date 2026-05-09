; DESCRIPTION: Creates a yellow circular shape at (159, 131) with radius 38.
; PLAN: r0=159(x), r1=131(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 131
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
