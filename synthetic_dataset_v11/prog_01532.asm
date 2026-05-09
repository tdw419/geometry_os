; DESCRIPTION: Draws a black circle centered at (206, 75) with radius 50.
; PLAN: r0=206(x), r1=75(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 75
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
