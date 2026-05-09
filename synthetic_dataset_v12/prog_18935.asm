; DESCRIPTION: Draws a white circle centered at (292, 48) with radius 12.
; PLAN: r0=292(x), r1=48(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 48
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
