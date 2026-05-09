; DESCRIPTION: Draws a white circle centered at (108, 117) with radius 53.
; PLAN: r0=108(x), r1=117(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 117
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
