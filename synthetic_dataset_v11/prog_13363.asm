; DESCRIPTION: Draws a black circle centered at (130, 100) with radius 67.
; PLAN: r0=130(x), r1=100(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 100
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
