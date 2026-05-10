; DESCRIPTION: Draws a white circle centered at (395, 153) with radius 77.
; PLAN: r0=395(x), r1=153(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 153
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
