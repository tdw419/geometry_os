; DESCRIPTION: Draws a green rectangle at (416, 39) with width 79 and height 62.
; PLAN: r0=416(x), r1=39(y), r2=79(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 39
LDI r2, 79
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
