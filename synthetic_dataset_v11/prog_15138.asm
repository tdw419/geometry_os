; DESCRIPTION: Draws a black rectangle at (183, 37) with width 68 and height 65.
; PLAN: r0=183(x), r1=37(y), r2=68(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 37
LDI r2, 68
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
