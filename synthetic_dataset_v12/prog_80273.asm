; DESCRIPTION: Draws a white circle centered at (415, 146) with radius 69.
; PLAN: r0=415(x), r1=146(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 146
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
