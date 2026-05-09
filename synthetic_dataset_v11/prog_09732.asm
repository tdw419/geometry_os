; DESCRIPTION: Draws a cyan circle centered at (93, 124) with radius 78.
; PLAN: r0=93(x), r1=124(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 124
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
