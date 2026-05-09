; DESCRIPTION: Draws a cyan circle centered at (105, 84) with radius 30.
; PLAN: r0=105(x), r1=84(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 84
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
