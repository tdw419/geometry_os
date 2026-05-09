; DESCRIPTION: Draws a yellow circle centered at (425, 111) with radius 62.
; PLAN: r0=425(x), r1=111(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 111
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
