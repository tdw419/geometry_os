; DESCRIPTION: Draws a cyan circle centered at (40, 55) with radius 23.
; PLAN: r0=40(x), r1=55(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 55
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
