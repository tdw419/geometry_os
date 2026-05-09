; DESCRIPTION: Draws a white circle centered at (186, 186) with radius 33.
; PLAN: r0=186(x), r1=186(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 186
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
