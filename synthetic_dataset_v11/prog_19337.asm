; DESCRIPTION: Draws a red circle centered at (124, 224) with radius 25.
; PLAN: r0=124(x), r1=224(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 224
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
