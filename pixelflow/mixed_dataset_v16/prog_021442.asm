; DESCRIPTION: Draws a red circle centered at (116, 76) with radius 28.
; PLAN: r0=116(x), r1=76(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 76
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
