; DESCRIPTION: Creates a yellow circular shape at (332, 135) with radius 12.
; PLAN: r0=332(x), r1=135(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 135
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
