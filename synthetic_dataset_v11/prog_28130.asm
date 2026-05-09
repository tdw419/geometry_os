; DESCRIPTION: Draws a cyan circle centered at (125, 106) with radius 60.
; PLAN: r0=125(x), r1=106(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 106
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
