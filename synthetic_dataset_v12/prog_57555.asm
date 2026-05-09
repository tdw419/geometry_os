; DESCRIPTION: Draws a green circle centered at (464, 43) with radius 16.
; PLAN: r0=464(x), r1=43(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 43
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
