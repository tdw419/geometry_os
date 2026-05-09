; DESCRIPTION: Creates a yellow circular shape at (286, 130) with radius 54.
; PLAN: r0=286(x), r1=130(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 130
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
