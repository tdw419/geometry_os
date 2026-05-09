; DESCRIPTION: Draws a cyan circle centered at (101, 110) with radius 68.
; PLAN: r0=101(x), r1=110(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 110
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
