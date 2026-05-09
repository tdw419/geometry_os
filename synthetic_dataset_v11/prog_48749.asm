; DESCRIPTION: Draws a cyan circle centered at (155, 80) with radius 49.
; PLAN: r0=155(x), r1=80(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 80
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
