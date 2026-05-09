; DESCRIPTION: Draws a cyan circle centered at (141, 115) with radius 75.
; PLAN: r0=141(x), r1=115(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 115
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
