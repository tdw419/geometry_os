; DESCRIPTION: Draws a green rectangle at (24, 11) with width 19 and height 67.
; PLAN: r0=24(x), r1=11(y), r2=19(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 11
LDI r2, 19
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
