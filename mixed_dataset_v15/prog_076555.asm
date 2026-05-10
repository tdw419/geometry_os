; DESCRIPTION: Draws a black circle centered at (303, 138) with radius 45.
; PLAN: r0=303(x), r1=138(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 138
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
