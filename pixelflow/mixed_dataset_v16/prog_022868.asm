; DESCRIPTION: Creates a magenta circular shape at (165, 159) with radius 76.
; PLAN: r0=165(x), r1=159(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 159
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
