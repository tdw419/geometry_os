; DESCRIPTION: Creates a magenta circular shape at (382, 43) with radius 25.
; PLAN: r0=382(x), r1=43(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 43
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
