; DESCRIPTION: Draws a cyan circle centered at (216, 39) with radius 15.
; PLAN: r0=216(x), r1=39(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 39
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
