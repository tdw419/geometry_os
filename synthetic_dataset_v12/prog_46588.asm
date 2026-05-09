; DESCRIPTION: Draws a red circle centered at (409, 192) with radius 61.
; PLAN: r0=409(x), r1=192(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 192
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
