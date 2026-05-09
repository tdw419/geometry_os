; DESCRIPTION: Draws a cyan circle centered at (142, 201) with radius 38.
; PLAN: r0=142(x), r1=201(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 201
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
