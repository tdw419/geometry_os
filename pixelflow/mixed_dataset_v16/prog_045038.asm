; DESCRIPTION: Draws a cyan circle centered at (34, 31) with radius 10.
; PLAN: r0=34(x), r1=31(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 31
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
