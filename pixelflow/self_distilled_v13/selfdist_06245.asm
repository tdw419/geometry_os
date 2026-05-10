; DESCRIPTION: Renders a green circular shape at (207, 177) with radius 66.
; PLAN: r0=207(x), r1=177(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 177
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
