; DESCRIPTION: Draws a red circle centered at (224, 92) with radius 40.
; PLAN: r0=224(x), r1=92(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 92
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
