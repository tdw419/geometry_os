; DESCRIPTION: Draws a magenta circle centered at (185, 44) with radius 54.
; PLAN: r0=185(x), r1=44(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 44
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
