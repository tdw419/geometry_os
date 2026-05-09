; DESCRIPTION: Draws a white circle centered at (380, 53) with radius 16.
; PLAN: r0=380(x), r1=53(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 53
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
