; DESCRIPTION: Draws a magenta circle centered at (265, 129) with radius 74.
; PLAN: r0=265(x), r1=129(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
