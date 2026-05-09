; DESCRIPTION: Draws a yellow circle centered at (44, 37) with radius 32.
; PLAN: r0=44(x), r1=37(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 37
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
