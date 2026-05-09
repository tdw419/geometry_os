; DESCRIPTION: Draws a white circle centered at (394, 139) with radius 70.
; PLAN: r0=394(x), r1=139(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 139
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
