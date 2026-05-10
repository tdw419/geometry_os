; DESCRIPTION: Draws a black circle centered at (214, 28) with radius 21.
; PLAN: r0=214(x), r1=28(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 28
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
