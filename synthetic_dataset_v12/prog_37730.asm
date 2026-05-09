; DESCRIPTION: Draws a cyan circle centered at (364, 121) with radius 48.
; PLAN: r0=364(x), r1=121(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 121
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
