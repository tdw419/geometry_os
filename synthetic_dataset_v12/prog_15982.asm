; DESCRIPTION: Draws a white circle centered at (156, 174) with radius 63.
; PLAN: r0=156(x), r1=174(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 174
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
