; DESCRIPTION: Draws a white circle centered at (474, 90) with radius 21.
; PLAN: r0=474(x), r1=90(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 90
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
