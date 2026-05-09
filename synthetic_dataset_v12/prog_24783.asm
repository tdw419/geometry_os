; DESCRIPTION: Draws a red circle centered at (245, 95) with radius 62.
; PLAN: r0=245(x), r1=95(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 95
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
