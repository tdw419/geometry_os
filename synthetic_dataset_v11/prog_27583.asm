; DESCRIPTION: Draws a black circle centered at (173, 131) with radius 14.
; PLAN: r0=173(x), r1=131(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 131
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
