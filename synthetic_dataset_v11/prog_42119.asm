; DESCRIPTION: Draws a magenta circle centered at (228, 228) with radius 14.
; PLAN: r0=228(x), r1=228(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 228
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
