; DESCRIPTION: Draws a cyan circle centered at (172, 157) with radius 54.
; PLAN: r0=172(x), r1=157(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 157
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
