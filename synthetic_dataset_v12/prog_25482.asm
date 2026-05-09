; DESCRIPTION: Draws a blue rectangle at (416, 117) with width 30 and height 116.
; PLAN: r0=416(x), r1=117(y), r2=30(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 117
LDI r2, 30
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
