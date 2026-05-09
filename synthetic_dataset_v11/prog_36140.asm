; DESCRIPTION: Draws a cyan circle centered at (179, 192) with radius 29.
; PLAN: r0=179(x), r1=192(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 192
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
