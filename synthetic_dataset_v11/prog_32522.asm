; DESCRIPTION: Draws a black circle centered at (206, 90) with radius 38.
; PLAN: r0=206(x), r1=90(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 90
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
