; DESCRIPTION: Draws a black circle centered at (350, 208) with radius 24.
; PLAN: r0=350(x), r1=208(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 208
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
