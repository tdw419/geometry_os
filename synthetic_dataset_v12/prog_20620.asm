; DESCRIPTION: Creates a magenta circular shape at (442, 119) with radius 18.
; PLAN: r0=442(x), r1=119(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 119
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
