; DESCRIPTION: Draws a cyan circle centered at (102, 55) with radius 37.
; PLAN: r0=102(x), r1=55(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 55
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
