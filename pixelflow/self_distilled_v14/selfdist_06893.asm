; DESCRIPTION: Renders a magenta circular shape at (188, 111) with radius 17.
; PLAN: r0=188(x), r1=111(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 111
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
