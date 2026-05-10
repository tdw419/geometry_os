; DESCRIPTION: Draws a red circle centered at (112, 62) with radius 54.
; PLAN: r0=112(x), r1=62(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 62
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
