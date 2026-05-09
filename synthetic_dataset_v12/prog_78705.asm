; DESCRIPTION: Draws a black circle centered at (360, 135) with radius 58.
; PLAN: r0=360(x), r1=135(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 135
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
