; DESCRIPTION: Renders a magenta circular shape at (7, 172) with radius 38.
; PLAN: r0=7(x), r1=172(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 7
LDI r1, 172
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
