; DESCRIPTION: Draws a red circle centered at (258, 87) with radius 30.
; PLAN: r0=258(x), r1=87(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 87
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
