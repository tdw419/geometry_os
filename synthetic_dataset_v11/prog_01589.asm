; DESCRIPTION: Creates a magenta circular shape at (113, 85) with radius 52.
; PLAN: r0=113(x), r1=85(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 85
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
