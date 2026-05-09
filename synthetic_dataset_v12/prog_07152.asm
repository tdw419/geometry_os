; DESCRIPTION: Draws a green rectangle at (313, 104) with width 50 and height 67.
; PLAN: r0=313(x), r1=104(y), r2=50(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 104
LDI r2, 50
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
