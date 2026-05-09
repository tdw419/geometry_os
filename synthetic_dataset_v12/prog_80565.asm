; DESCRIPTION: Creates a magenta circular shape at (50, 52) with radius 18.
; PLAN: r0=50(x), r1=52(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 52
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
