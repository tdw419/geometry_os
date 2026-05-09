; DESCRIPTION: Creates a yellow circular shape at (130, 171) with radius 78.
; PLAN: r0=130(x), r1=171(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 171
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
