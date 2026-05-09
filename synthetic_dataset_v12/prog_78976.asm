; DESCRIPTION: Draws a white circle centered at (40, 230) with radius 16.
; PLAN: r0=40(x), r1=230(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 230
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
