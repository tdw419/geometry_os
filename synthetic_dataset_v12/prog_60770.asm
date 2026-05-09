; DESCRIPTION: Draws a white circle centered at (398, 70) with radius 47.
; PLAN: r0=398(x), r1=70(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 70
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
