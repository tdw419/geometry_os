; DESCRIPTION: Creates a magenta circular shape at (434, 67) with radius 52.
; PLAN: r0=434(x), r1=67(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 67
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
