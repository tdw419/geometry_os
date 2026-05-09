; DESCRIPTION: Draws a black circle centered at (141, 33) with radius 27.
; PLAN: r0=141(x), r1=33(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 33
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
