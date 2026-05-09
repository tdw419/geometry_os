; DESCRIPTION: Draws a blue circle centered at (31, 146) with radius 18.
; PLAN: r0=31(x), r1=146(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 146
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
