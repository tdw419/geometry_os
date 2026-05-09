; DESCRIPTION: Draws a black circle centered at (403, 104) with radius 40.
; PLAN: r0=403(x), r1=104(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 104
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
