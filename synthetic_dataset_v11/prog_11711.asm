; DESCRIPTION: Draws a magenta circle centered at (117, 94) with radius 80.
; PLAN: r0=117(x), r1=94(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 94
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
