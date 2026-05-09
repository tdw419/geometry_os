; DESCRIPTION: Draws a cyan circle centered at (181, 124) with radius 70.
; PLAN: r0=181(x), r1=124(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 124
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
