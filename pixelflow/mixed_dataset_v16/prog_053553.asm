; DESCRIPTION: Draws a white circle centered at (271, 82) with radius 75.
; PLAN: r0=271(x), r1=82(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 82
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
