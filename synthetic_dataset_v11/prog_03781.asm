; DESCRIPTION: Draws a white circle centered at (113, 91) with radius 43.
; PLAN: r0=113(x), r1=91(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 91
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
