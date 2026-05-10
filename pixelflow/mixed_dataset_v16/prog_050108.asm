; DESCRIPTION: Renders a yellow circular shape at (334, 96) with radius 57.
; PLAN: r0=334(x), r1=96(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 96
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
