; DESCRIPTION: Draws a blue rectangle at (297, 75) with width 67 and height 37.
; PLAN: r0=297(x), r1=75(y), r2=67(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 75
LDI r2, 67
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
