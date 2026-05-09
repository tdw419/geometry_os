; DESCRIPTION: Draws a green circle centered at (147, 107) with radius 64.
; PLAN: r0=147(x), r1=107(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 107
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
