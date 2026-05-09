; DESCRIPTION: Draws a magenta circle centered at (113, 91) with radius 54.
; PLAN: r0=113(x), r1=91(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 91
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
