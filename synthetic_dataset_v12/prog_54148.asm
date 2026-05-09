; DESCRIPTION: Draws a white circle centered at (255, 115) with radius 61.
; PLAN: r0=255(x), r1=115(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 115
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
