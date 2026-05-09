; DESCRIPTION: Creates a yellow circular shape at (419, 189) with radius 29.
; PLAN: r0=419(x), r1=189(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 189
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
