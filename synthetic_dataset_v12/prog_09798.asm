; DESCRIPTION: Draws a cyan circle centered at (139, 174) with radius 70.
; PLAN: r0=139(x), r1=174(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 174
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
