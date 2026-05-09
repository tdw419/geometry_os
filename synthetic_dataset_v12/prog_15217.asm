; DESCRIPTION: Creates a yellow circular shape at (360, 130) with radius 58.
; PLAN: r0=360(x), r1=130(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 130
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
