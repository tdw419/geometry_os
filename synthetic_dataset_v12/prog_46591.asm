; DESCRIPTION: Draws a white circle centered at (350, 98) with radius 43.
; PLAN: r0=350(x), r1=98(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 98
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
