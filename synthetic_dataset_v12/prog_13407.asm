; DESCRIPTION: Draws a white circle centered at (460, 79) with radius 16.
; PLAN: r0=460(x), r1=79(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 79
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
