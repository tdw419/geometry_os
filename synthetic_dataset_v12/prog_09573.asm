; DESCRIPTION: Draws a cyan circle centered at (389, 86) with radius 49.
; PLAN: r0=389(x), r1=86(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 86
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
