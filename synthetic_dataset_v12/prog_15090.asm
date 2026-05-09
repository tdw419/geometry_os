; DESCRIPTION: Draws a black circle centered at (206, 55) with radius 12.
; PLAN: r0=206(x), r1=55(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 55
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
