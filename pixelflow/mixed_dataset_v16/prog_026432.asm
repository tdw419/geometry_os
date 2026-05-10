; DESCRIPTION: Creates a blue circular shape at (214, 113) with radius 64.
; PLAN: r0=214(x), r1=113(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 113
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
