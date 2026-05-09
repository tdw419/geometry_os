; DESCRIPTION: Draws a red circle centered at (405, 192) with radius 29.
; PLAN: r0=405(x), r1=192(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 192
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
