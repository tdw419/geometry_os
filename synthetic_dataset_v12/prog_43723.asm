; DESCRIPTION: Creates a yellow circular shape at (171, 64) with radius 39.
; PLAN: r0=171(x), r1=64(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 64
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
