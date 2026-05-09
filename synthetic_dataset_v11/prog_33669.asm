; DESCRIPTION: Draws a black circle centered at (120, 157) with radius 80.
; PLAN: r0=120(x), r1=157(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 157
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
