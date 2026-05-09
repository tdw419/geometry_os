; DESCRIPTION: Draws a red circle centered at (418, 96) with radius 80.
; PLAN: r0=418(x), r1=96(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 96
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
