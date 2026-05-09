; DESCRIPTION: Draws a black rectangle at (462, 182) with width 21 and height 25.
; PLAN: r0=462(x), r1=182(y), r2=21(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 182
LDI r2, 21
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
