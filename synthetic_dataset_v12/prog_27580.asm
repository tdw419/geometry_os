; DESCRIPTION: Draws a black circle centered at (370, 59) with radius 29.
; PLAN: r0=370(x), r1=59(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 59
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
