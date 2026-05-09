; DESCRIPTION: Draws a black circle centered at (130, 107) with radius 16.
; PLAN: r0=130(x), r1=107(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 107
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
