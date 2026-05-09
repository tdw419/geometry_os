; DESCRIPTION: Draws a white circle centered at (38, 111) with radius 37.
; PLAN: r0=38(x), r1=111(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 111
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
