; DESCRIPTION: Draws a magenta circle centered at (72, 47) with radius 20.
; PLAN: r0=72(x), r1=47(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 47
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
