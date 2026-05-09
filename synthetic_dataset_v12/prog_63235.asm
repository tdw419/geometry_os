; DESCRIPTION: Draws a magenta circle centered at (404, 112) with radius 57.
; PLAN: r0=404(x), r1=112(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 112
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
