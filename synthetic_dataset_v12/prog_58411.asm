; DESCRIPTION: Draws a cyan circle centered at (194, 216) with radius 12.
; PLAN: r0=194(x), r1=216(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 216
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
