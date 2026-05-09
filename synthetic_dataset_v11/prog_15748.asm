; DESCRIPTION: Creates a yellow circular shape at (104, 113) with radius 32.
; PLAN: r0=104(x), r1=113(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 113
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
