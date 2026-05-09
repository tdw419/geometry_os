; DESCRIPTION: Creates a yellow circular shape at (183, 108) with radius 34.
; PLAN: r0=183(x), r1=108(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 108
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
