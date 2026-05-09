; DESCRIPTION: Draws a white circle centered at (78, 152) with radius 70.
; PLAN: r0=78(x), r1=152(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 152
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
