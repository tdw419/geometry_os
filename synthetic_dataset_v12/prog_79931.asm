; DESCRIPTION: Draws a white circle centered at (186, 66) with radius 18.
; PLAN: r0=186(x), r1=66(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 66
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
