; DESCRIPTION: Draws a cyan circle centered at (216, 73) with radius 56.
; PLAN: r0=216(x), r1=73(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 73
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
