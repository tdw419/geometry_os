; DESCRIPTION: Draws a green rectangle at (310, 67) with width 114 and height 85.
; PLAN: r0=310(x), r1=67(y), r2=114(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 67
LDI r2, 114
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
