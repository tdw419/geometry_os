; DESCRIPTION: Draws a red circle centered at (439, 137) with radius 62.
; PLAN: r0=439(x), r1=137(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 137
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
