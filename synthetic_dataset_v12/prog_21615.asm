; DESCRIPTION: Draws a cyan circle centered at (122, 115) with radius 10.
; PLAN: r0=122(x), r1=115(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 115
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
