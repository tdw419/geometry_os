; DESCRIPTION: Draws a black circle centered at (80, 210) with radius 33.
; PLAN: r0=80(x), r1=210(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 210
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
