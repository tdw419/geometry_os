; DESCRIPTION: Renders a cyan circular shape at (381, 104) with radius 65.
; PLAN: r0=381(x), r1=104(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 104
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
