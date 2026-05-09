; DESCRIPTION: Draws a black circle centered at (189, 135) with radius 27.
; PLAN: r0=189(x), r1=135(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 135
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
