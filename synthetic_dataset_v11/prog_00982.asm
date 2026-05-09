; DESCRIPTION: Draws a magenta circle centered at (146, 139) with radius 70.
; PLAN: r0=146(x), r1=139(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 139
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
