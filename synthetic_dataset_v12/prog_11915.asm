; DESCRIPTION: Draws a white circle centered at (331, 146) with radius 28.
; PLAN: r0=331(x), r1=146(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 146
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
