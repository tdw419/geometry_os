; DESCRIPTION: Draws a yellow circle centered at (177, 176) with radius 40.
; PLAN: r0=177(x), r1=176(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 176
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
