; DESCRIPTION: Draws a black circle centered at (135, 204) with radius 44.
; PLAN: r0=135(x), r1=204(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 204
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
