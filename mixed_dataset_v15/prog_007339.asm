; DESCRIPTION: Draws a magenta circle centered at (180, 62) with radius 44.
; PLAN: r0=180(x), r1=62(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 62
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
