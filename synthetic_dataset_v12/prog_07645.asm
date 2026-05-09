; DESCRIPTION: Draws a black circle centered at (243, 105) with radius 72.
; PLAN: r0=243(x), r1=105(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 105
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
