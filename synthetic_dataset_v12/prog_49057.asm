; DESCRIPTION: Draws a black circle centered at (174, 129) with radius 76.
; PLAN: r0=174(x), r1=129(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 129
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
