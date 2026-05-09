; DESCRIPTION: Draws a red circle centered at (192, 83) with radius 50.
; PLAN: r0=192(x), r1=83(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 83
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
