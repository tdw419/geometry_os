; DESCRIPTION: Draws a black rectangle at (203, 115) with width 39 and height 118.
; PLAN: r0=203(x), r1=115(y), r2=39(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 115
LDI r2, 39
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
