; DESCRIPTION: Draws a blue rectangle at (175, 70) with width 105 and height 67.
; PLAN: r0=175(x), r1=70(y), r2=105(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 70
LDI r2, 105
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
