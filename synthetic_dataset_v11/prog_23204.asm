; DESCRIPTION: Draws a white circle centered at (90, 125) with radius 55.
; PLAN: r0=90(x), r1=125(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 125
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
