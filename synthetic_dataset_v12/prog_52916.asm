; DESCRIPTION: Draws a white circle centered at (371, 150) with radius 45.
; PLAN: r0=371(x), r1=150(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 150
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
