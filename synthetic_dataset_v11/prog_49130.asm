; DESCRIPTION: Draws a cyan circle centered at (58, 83) with radius 20.
; PLAN: r0=58(x), r1=83(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 83
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
