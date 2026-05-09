; DESCRIPTION: Draws a green circle centered at (138, 46) with radius 37.
; PLAN: r0=138(x), r1=46(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 46
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
