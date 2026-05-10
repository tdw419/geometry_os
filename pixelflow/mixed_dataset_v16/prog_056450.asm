; DESCRIPTION: Draws a green rectangle at (416, 17) with width 32 and height 69.
; PLAN: r0=416(x), r1=17(y), r2=32(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 17
LDI r2, 32
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
