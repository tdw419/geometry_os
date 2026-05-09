; DESCRIPTION: Draws a green circle centered at (174, 203) with radius 35.
; PLAN: r0=174(x), r1=203(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 203
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
