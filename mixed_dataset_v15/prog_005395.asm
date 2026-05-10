; DESCRIPTION: Draws a black circle centered at (165, 74) with radius 20.
; PLAN: r0=165(x), r1=74(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 74
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
