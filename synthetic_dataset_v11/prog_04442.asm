; DESCRIPTION: Creates a yellow circular shape at (184, 178) with radius 71.
; PLAN: r0=184(x), r1=178(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 178
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
