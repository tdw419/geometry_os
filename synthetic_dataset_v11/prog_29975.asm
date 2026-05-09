; DESCRIPTION: Draws a magenta circle centered at (169, 34) with radius 22.
; PLAN: r0=169(x), r1=34(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 34
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
