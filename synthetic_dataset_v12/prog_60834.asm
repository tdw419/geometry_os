; DESCRIPTION: Creates a magenta circular shape at (203, 113) with radius 64.
; PLAN: r0=203(x), r1=113(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 113
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
