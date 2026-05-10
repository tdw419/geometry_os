; DESCRIPTION: Creates a yellow circular shape at (332, 74) with radius 72.
; PLAN: r0=332(x), r1=74(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 74
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
