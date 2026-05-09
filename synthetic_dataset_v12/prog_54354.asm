; DESCRIPTION: Draws a cyan circle centered at (406, 163) with radius 32.
; PLAN: r0=406(x), r1=163(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 163
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
