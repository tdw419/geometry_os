; DESCRIPTION: Renders a magenta circular shape at (219, 111) with radius 26.
; PLAN: r0=219(x), r1=111(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 111
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
