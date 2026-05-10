; DESCRIPTION: Draws a green circle centered at (372, 120) with radius 26.
; PLAN: r0=372(x), r1=120(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 120
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
