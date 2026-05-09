; DESCRIPTION: Draws a cyan circle centered at (153, 110) with radius 78.
; PLAN: r0=153(x), r1=110(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 110
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
