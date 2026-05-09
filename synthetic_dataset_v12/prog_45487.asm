; DESCRIPTION: Draws a cyan circle centered at (40, 141) with radius 34.
; PLAN: r0=40(x), r1=141(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 141
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
