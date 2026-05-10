; DESCRIPTION: Draws a cyan circle centered at (98, 104) with radius 56.
; PLAN: r0=98(x), r1=104(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 104
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
