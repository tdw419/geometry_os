; DESCRIPTION: Renders a magenta circular shape at (17, 62) with radius 78.
; PLAN: r0=17(x), r1=62(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 62
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
