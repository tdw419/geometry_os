; DESCRIPTION: Draws a cyan circle centered at (202, 104) with radius 30.
; PLAN: r0=202(x), r1=104(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 104
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
