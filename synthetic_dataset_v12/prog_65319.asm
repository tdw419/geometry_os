; DESCRIPTION: Draws a black circle centered at (132, 130) with radius 80.
; PLAN: r0=132(x), r1=130(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 130
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
