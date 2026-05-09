; DESCRIPTION: Draws a magenta circle centered at (404, 181) with radius 73.
; PLAN: r0=404(x), r1=181(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 181
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
