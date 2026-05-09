; DESCRIPTION: Creates a yellow circular shape at (125, 78) with radius 57.
; PLAN: r0=125(x), r1=78(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 78
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
