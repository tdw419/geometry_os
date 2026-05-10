; DESCRIPTION: Draws a green rectangle at (343, 182) with width 18 and height 66.
; PLAN: r0=343(x), r1=182(y), r2=18(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 182
LDI r2, 18
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
