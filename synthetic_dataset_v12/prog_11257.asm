; DESCRIPTION: Draws a green rectangle at (375, 182) with width 13 and height 49.
; PLAN: r0=375(x), r1=182(y), r2=13(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 182
LDI r2, 13
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
