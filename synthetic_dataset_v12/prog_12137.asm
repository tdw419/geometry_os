; DESCRIPTION: Draws a white circle centered at (174, 124) with radius 15.
; PLAN: r0=174(x), r1=124(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 124
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
