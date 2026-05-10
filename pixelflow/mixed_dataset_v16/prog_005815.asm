; DESCRIPTION: Draws a white circle centered at (174, 71) with radius 49.
; PLAN: r0=174(x), r1=71(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 71
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
