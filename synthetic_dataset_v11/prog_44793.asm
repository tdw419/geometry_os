; DESCRIPTION: Draws a white circle centered at (39, 47) with radius 17.
; PLAN: r0=39(x), r1=47(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 47
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
