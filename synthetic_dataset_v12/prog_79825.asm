; DESCRIPTION: Creates a yellow circular shape at (167, 151) with radius 74.
; PLAN: r0=167(x), r1=151(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 151
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
