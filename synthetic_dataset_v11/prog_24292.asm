; DESCRIPTION: Draws a black circle centered at (110, 173) with radius 73.
; PLAN: r0=110(x), r1=173(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 173
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
