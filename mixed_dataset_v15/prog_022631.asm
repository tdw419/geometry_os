; DESCRIPTION: Draws a green rectangle at (416, 155) with width 67 and height 42.
; PLAN: r0=416(x), r1=155(y), r2=67(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 155
LDI r2, 67
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
