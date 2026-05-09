; DESCRIPTION: Draws a white circle centered at (210, 194) with radius 21.
; PLAN: r0=210(x), r1=194(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 194
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
