; DESCRIPTION: Draws a green rectangle at (183, 182) with width 86 and height 13.
; PLAN: r0=183(x), r1=182(y), r2=86(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 182
LDI r2, 86
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
