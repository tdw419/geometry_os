; DESCRIPTION: Draws a red circle centered at (431, 154) with radius 49.
; PLAN: r0=431(x), r1=154(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 154
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
