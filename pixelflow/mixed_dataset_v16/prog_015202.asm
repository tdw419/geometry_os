; DESCRIPTION: Creates a yellow circular shape at (86, 56) with radius 18.
; PLAN: r0=86(x), r1=56(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 56
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
