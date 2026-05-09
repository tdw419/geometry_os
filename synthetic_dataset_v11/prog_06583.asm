; DESCRIPTION: Draws a black circle centered at (217, 187) with radius 18.
; PLAN: r0=217(x), r1=187(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 187
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
