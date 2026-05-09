; DESCRIPTION: Draws a white circle centered at (440, 91) with radius 61.
; PLAN: r0=440(x), r1=91(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 91
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
