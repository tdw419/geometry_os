; DESCRIPTION: Draws a black circle centered at (245, 150) with radius 44.
; PLAN: r0=245(x), r1=150(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 150
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
