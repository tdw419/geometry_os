; DESCRIPTION: Draws a black circle centered at (112, 50) with radius 16.
; PLAN: r0=112(x), r1=50(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 50
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
