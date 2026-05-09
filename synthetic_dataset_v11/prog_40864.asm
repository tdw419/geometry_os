; DESCRIPTION: Draws a magenta circle centered at (152, 146) with radius 33.
; PLAN: r0=152(x), r1=146(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 146
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
