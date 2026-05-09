; DESCRIPTION: Draws a cyan circle centered at (436, 163) with radius 22.
; PLAN: r0=436(x), r1=163(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 163
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
