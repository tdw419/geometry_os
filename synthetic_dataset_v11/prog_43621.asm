; DESCRIPTION: Draws a yellow circle centered at (66, 189) with radius 28.
; PLAN: r0=66(x), r1=189(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 189
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
