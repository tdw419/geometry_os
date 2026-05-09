; DESCRIPTION: Draws a red circle centered at (268, 62) with radius 46.
; PLAN: r0=268(x), r1=62(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 62
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
