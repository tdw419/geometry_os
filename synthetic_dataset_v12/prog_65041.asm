; DESCRIPTION: Creates a magenta circular shape at (43, 240) with radius 15.
; PLAN: r0=43(x), r1=240(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 240
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
