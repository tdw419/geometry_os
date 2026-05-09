; DESCRIPTION: Draws a magenta circle centered at (109, 152) with radius 50.
; PLAN: r0=109(x), r1=152(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 152
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
