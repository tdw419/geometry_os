; DESCRIPTION: Draws a green circle centered at (234, 203) with radius 21.
; PLAN: r0=234(x), r1=203(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 203
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
