; DESCRIPTION: Renders a magenta circular shape at (361, 28) with radius 18.
; PLAN: r0=361(x), r1=28(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 28
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
