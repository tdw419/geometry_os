; DESCRIPTION: Draws a black circle centered at (337, 154) with radius 17.
; PLAN: r0=337(x), r1=154(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 154
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
