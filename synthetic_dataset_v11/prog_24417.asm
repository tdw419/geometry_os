; DESCRIPTION: Creates a blue circular shape at (173, 189) with radius 43.
; PLAN: r0=173(x), r1=189(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 189
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
