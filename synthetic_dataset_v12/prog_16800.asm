; DESCRIPTION: Draws a blue rectangle at (309, 0) with width 67 and height 104.
; PLAN: r0=309(x), r1=0(y), r2=67(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 0
LDI r2, 67
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
