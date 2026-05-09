; DESCRIPTION: Draws a white circle centered at (108, 124) with radius 14.
; PLAN: r0=108(x), r1=124(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 124
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
