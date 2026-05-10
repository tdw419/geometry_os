; DESCRIPTION: Draws a white circle centered at (0, 44) with radius 68.
; PLAN: r0=0(x), r1=44(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 0
LDI r1, 44
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
