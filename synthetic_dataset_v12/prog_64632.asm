; DESCRIPTION: Draws a white circle centered at (391, 154) with radius 70.
; PLAN: r0=391(x), r1=154(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 154
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
