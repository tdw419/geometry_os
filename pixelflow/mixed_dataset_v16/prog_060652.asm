; DESCRIPTION: Renders a magenta circular shape at (320, 163) with radius 78.
; PLAN: r0=320(x), r1=163(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 163
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
