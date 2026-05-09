; DESCRIPTION: Draws a green circle centered at (374, 107) with radius 72.
; PLAN: r0=374(x), r1=107(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 107
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
