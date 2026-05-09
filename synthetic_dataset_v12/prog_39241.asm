; DESCRIPTION: Draws a white circle centered at (222, 164) with radius 25.
; PLAN: r0=222(x), r1=164(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 164
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
