; DESCRIPTION: Draws a magenta circle centered at (120, 129) with radius 76.
; PLAN: r0=120(x), r1=129(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 129
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
