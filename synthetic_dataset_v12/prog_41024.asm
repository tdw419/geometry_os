; DESCRIPTION: Creates a magenta circular shape at (403, 81) with radius 64.
; PLAN: r0=403(x), r1=81(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 81
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
