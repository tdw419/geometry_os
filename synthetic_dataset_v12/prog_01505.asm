; DESCRIPTION: Draws a black circle centered at (474, 233) with radius 22.
; PLAN: r0=474(x), r1=233(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 233
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
