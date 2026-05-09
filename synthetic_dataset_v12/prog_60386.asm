; DESCRIPTION: Creates a yellow circular shape at (332, 151) with radius 28.
; PLAN: r0=332(x), r1=151(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 151
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
