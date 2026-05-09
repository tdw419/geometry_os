; DESCRIPTION: Renders a magenta disk with center (85, 165) and radius 39.
; PLAN: r0=85(x), r1=165(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 165
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
