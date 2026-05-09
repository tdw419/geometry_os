; DESCRIPTION: Draws a white circle centered at (186, 146) with radius 37.
; PLAN: r0=186(x), r1=146(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 146
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
