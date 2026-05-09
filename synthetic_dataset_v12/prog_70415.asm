; DESCRIPTION: Draws a cyan circle centered at (216, 200) with radius 49.
; PLAN: r0=216(x), r1=200(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 200
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
