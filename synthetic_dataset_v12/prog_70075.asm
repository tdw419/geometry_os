; DESCRIPTION: Draws a red circle centered at (268, 109) with radius 76.
; PLAN: r0=268(x), r1=109(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 109
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
