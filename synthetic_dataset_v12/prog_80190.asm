; DESCRIPTION: Creates a magenta circular shape at (257, 64) with radius 41.
; PLAN: r0=257(x), r1=64(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 64
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
