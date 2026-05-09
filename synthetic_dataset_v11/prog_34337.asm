; DESCRIPTION: Draws a red circle centered at (192, 46) with radius 43.
; PLAN: r0=192(x), r1=46(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 46
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
