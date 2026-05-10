; DESCRIPTION: Draws a cyan circle centered at (110, 24) with radius 33.
; PLAN: r0=110(x), r1=24(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 24
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
