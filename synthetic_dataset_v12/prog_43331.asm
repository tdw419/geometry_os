; DESCRIPTION: Draws a white circle centered at (415, 175) with radius 50.
; PLAN: r0=415(x), r1=175(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 175
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
