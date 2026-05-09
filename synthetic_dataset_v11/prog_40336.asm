; DESCRIPTION: Draws a white circle centered at (79, 100) with radius 50.
; PLAN: r0=79(x), r1=100(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 100
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
