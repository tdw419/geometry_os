; DESCRIPTION: Draws a white circle centered at (241, 70) with radius 25.
; PLAN: r0=241(x), r1=70(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 70
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
