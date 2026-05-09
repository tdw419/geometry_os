; DESCRIPTION: Draws a white circle centered at (206, 225) with radius 21.
; PLAN: r0=206(x), r1=225(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 225
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
