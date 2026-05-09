; DESCRIPTION: Draws a green rectangle at (411, 2) with width 67 and height 11.
; PLAN: r0=411(x), r1=2(y), r2=67(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 2
LDI r2, 67
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
