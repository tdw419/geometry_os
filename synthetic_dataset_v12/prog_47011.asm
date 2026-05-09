; DESCRIPTION: Draws a red circle centered at (259, 199) with radius 49.
; PLAN: r0=259(x), r1=199(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 199
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
