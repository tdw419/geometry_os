; DESCRIPTION: Creates a magenta circular shape at (400, 155) with radius 64.
; PLAN: r0=400(x), r1=155(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 155
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
