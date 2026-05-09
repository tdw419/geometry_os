; DESCRIPTION: Draws a cyan circle centered at (104, 241) with radius 14.
; PLAN: r0=104(x), r1=241(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 241
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
