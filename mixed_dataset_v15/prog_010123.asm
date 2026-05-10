; DESCRIPTION: Draws a black circle centered at (169, 146) with radius 66.
; PLAN: r0=169(x), r1=146(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 146
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
