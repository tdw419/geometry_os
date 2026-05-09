; DESCRIPTION: Draws a white circle centered at (70, 144) with radius 70.
; PLAN: r0=70(x), r1=144(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 144
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
