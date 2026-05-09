; DESCRIPTION: Draws a cyan circle centered at (187, 97) with radius 75.
; PLAN: r0=187(x), r1=97(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 97
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
