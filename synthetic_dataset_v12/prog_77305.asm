; DESCRIPTION: Draws a white circle centered at (90, 83) with radius 36.
; PLAN: r0=90(x), r1=83(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 83
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
