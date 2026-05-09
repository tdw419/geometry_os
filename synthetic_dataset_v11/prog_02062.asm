; DESCRIPTION: Draws a green circle centered at (164, 59) with radius 21.
; PLAN: r0=164(x), r1=59(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 59
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
