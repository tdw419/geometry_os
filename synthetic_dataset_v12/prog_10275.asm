; DESCRIPTION: Draws a black circle centered at (118, 223) with radius 33.
; PLAN: r0=118(x), r1=223(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 223
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
