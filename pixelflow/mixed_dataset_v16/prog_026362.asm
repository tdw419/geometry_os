; DESCRIPTION: Draws a yellow circle centered at (200, 107) with radius 36.
; PLAN: r0=200(x), r1=107(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 107
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
