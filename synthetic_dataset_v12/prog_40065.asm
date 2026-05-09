; DESCRIPTION: Draws a black circle centered at (72, 214) with radius 28.
; PLAN: r0=72(x), r1=214(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 214
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
