; DESCRIPTION: Draws a white circle centered at (75, 152) with radius 28.
; PLAN: r0=75(x), r1=152(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 152
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
