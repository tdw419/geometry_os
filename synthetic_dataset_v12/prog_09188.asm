; DESCRIPTION: Draws a cyan circle centered at (134, 135) with radius 68.
; PLAN: r0=134(x), r1=135(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 135
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
