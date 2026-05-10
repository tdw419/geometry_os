; DESCRIPTION: Draws a red circle centered at (102, 224) with radius 21.
; PLAN: r0=102(x), r1=224(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 224
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
