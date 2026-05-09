; DESCRIPTION: Draws a white circle centered at (408, 210) with radius 43.
; PLAN: r0=408(x), r1=210(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 210
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
