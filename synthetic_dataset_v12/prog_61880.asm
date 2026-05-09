; DESCRIPTION: Draws a green circle centered at (464, 191) with radius 33.
; PLAN: r0=464(x), r1=191(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 191
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
