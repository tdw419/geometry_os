; DESCRIPTION: Draws a blue rectangle at (8, 182) with width 38 and height 15.
; PLAN: r0=8(x), r1=182(y), r2=38(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 182
LDI r2, 38
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
