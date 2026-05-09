; DESCRIPTION: Draws a black circle centered at (367, 117) with radius 77.
; PLAN: r0=367(x), r1=117(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 117
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
