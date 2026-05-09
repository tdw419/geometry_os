; DESCRIPTION: Draws a black circle centered at (170, 146) with radius 34.
; PLAN: r0=170(x), r1=146(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 146
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
