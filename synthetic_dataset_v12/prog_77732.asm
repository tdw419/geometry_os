; DESCRIPTION: Draws a white circle centered at (211, 90) with radius 68.
; PLAN: r0=211(x), r1=90(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 90
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
