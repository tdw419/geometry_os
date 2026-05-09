; DESCRIPTION: Creates a yellow circular shape at (184, 88) with radius 29.
; PLAN: r0=184(x), r1=88(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 88
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
