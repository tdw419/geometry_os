; DESCRIPTION: Draws a white circle centered at (371, 146) with radius 73.
; PLAN: r0=371(x), r1=146(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 146
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
