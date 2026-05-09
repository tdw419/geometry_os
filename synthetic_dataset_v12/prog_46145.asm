; DESCRIPTION: Creates a yellow circular shape at (410, 130) with radius 30.
; PLAN: r0=410(x), r1=130(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 130
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
