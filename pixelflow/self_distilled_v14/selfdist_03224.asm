; DESCRIPTION: Draws a cyan circle centered at (201, 141) with radius 38.
; PLAN: r0=201(x), r1=141(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 141
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
