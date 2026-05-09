; DESCRIPTION: Draws a black circle centered at (243, 144) with radius 61.
; PLAN: r0=243(x), r1=144(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 144
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
