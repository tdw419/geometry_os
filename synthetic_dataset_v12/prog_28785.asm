; DESCRIPTION: Draws a black circle centered at (193, 99) with radius 64.
; PLAN: r0=193(x), r1=99(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 99
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
