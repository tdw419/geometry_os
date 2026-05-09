; DESCRIPTION: Draws a black circle centered at (366, 64) with radius 27.
; PLAN: r0=366(x), r1=64(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 64
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
