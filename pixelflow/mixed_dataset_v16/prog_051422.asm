; DESCRIPTION: Draws a green circle centered at (399, 177) with radius 71.
; PLAN: r0=399(x), r1=177(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 177
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
