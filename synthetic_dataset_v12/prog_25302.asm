; DESCRIPTION: Draws a blue rectangle at (95, 134) with width 67 and height 15.
; PLAN: r0=95(x), r1=134(y), r2=67(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 134
LDI r2, 67
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
