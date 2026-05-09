; DESCRIPTION: Draws a green circle centered at (368, 135) with radius 23.
; PLAN: r0=368(x), r1=135(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 135
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
