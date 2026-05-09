; DESCRIPTION: Creates a blue circular shape at (239, 101) with radius 47.
; PLAN: r0=239(x), r1=101(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 101
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
