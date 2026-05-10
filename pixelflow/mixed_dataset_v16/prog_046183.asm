; DESCRIPTION: Draws a cyan circle centered at (388, 34) with radius 19.
; PLAN: r0=388(x), r1=34(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 34
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
