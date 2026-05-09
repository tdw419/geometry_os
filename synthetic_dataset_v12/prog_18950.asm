; DESCRIPTION: Draws a black circle centered at (422, 58) with radius 56.
; PLAN: r0=422(x), r1=58(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 58
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
