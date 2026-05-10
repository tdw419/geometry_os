; DESCRIPTION: Draws a white circle centered at (245, 139) with radius 10.
; PLAN: r0=245(x), r1=139(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 139
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
