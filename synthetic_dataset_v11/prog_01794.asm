; DESCRIPTION: Draws a black circle centered at (54, 108) with radius 50.
; PLAN: r0=54(x), r1=108(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 108
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
