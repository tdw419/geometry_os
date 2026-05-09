; DESCRIPTION: Draws a magenta circle centered at (94, 213) with radius 21.
; PLAN: r0=94(x), r1=213(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 213
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
