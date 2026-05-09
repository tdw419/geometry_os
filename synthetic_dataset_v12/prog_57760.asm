; DESCRIPTION: Draws a black circle centered at (450, 139) with radius 30.
; PLAN: r0=450(x), r1=139(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 139
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
