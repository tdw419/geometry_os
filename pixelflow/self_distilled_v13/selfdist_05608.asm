; DESCRIPTION: Renders a magenta circular shape at (343, 3) with radius 20.
; PLAN: r0=343(x), r1=3(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 3
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
