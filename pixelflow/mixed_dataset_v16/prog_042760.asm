; DESCRIPTION: Draws a green rectangle at (170, 70) with width 67 and height 78.
; PLAN: r0=170(x), r1=70(y), r2=67(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 70
LDI r2, 67
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
