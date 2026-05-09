; DESCRIPTION: Draws a black circle centered at (127, 170) with radius 77.
; PLAN: r0=127(x), r1=170(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 170
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
