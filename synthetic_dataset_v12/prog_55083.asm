; DESCRIPTION: Draws a cyan circle centered at (164, 124) with radius 18.
; PLAN: r0=164(x), r1=124(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 124
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
