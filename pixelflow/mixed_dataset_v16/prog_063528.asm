; DESCRIPTION: Draws a white circle centered at (407, 208) with radius 12.
; PLAN: r0=407(x), r1=208(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 208
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
