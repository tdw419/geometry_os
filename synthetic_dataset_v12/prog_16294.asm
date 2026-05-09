; DESCRIPTION: Draws a red circle centered at (289, 144) with radius 52.
; PLAN: r0=289(x), r1=144(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 144
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
