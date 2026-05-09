; DESCRIPTION: Draws a magenta circle centered at (169, 146) with radius 40.
; PLAN: r0=169(x), r1=146(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 146
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
