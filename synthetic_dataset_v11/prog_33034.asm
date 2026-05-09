; DESCRIPTION: Draws a white circle centered at (60, 150) with radius 22.
; PLAN: r0=60(x), r1=150(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 150
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
