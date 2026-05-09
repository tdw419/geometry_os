; DESCRIPTION: Draws a magenta circle centered at (74, 129) with radius 63.
; PLAN: r0=74(x), r1=129(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 129
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
