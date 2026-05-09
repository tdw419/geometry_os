; DESCRIPTION: Draws a white circle centered at (75, 95) with radius 61.
; PLAN: r0=75(x), r1=95(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 95
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
