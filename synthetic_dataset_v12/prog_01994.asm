; DESCRIPTION: Creates a blue circular shape at (291, 116) with radius 26.
; PLAN: r0=291(x), r1=116(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 116
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
