; DESCRIPTION: Draws a cyan circle centered at (91, 179) with radius 74.
; PLAN: r0=91(x), r1=179(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 179
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
