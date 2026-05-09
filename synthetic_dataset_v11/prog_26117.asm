; DESCRIPTION: Draws a magenta circle centered at (171, 109) with radius 50.
; PLAN: r0=171(x), r1=109(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 109
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
