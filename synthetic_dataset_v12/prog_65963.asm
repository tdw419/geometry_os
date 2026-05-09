; DESCRIPTION: Draws a red circle centered at (416, 105) with radius 74.
; PLAN: r0=416(x), r1=105(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 105
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
