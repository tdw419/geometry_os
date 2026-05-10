; DESCRIPTION: Draws a cyan circle centered at (342, 119) with radius 80.
; PLAN: r0=342(x), r1=119(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 119
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
