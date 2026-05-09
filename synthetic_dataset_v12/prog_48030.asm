; DESCRIPTION: Draws a green circle centered at (372, 46) with radius 13.
; PLAN: r0=372(x), r1=46(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 46
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
