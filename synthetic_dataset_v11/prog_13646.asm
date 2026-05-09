; DESCRIPTION: Draws a black circle centered at (28, 77) with radius 21.
; PLAN: r0=28(x), r1=77(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 77
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
