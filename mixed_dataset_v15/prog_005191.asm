; DESCRIPTION: Draws a white circle centered at (392, 110) with radius 68.
; PLAN: r0=392(x), r1=110(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 110
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
