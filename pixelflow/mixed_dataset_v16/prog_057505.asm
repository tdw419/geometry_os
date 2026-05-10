; DESCRIPTION: Draws a black rectangle at (303, 39) with width 81 and height 90.
; PLAN: r0=303(x), r1=39(y), r2=81(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 39
LDI r2, 81
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
