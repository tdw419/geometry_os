; DESCRIPTION: Draws a green circle centered at (68, 107) with radius 52.
; PLAN: r0=68(x), r1=107(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 107
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
