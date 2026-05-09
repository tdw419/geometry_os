; DESCRIPTION: Draws a red circle centered at (486, 195) with radius 17.
; PLAN: r0=486(x), r1=195(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 195
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
