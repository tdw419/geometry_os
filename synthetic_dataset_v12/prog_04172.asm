; DESCRIPTION: Draws a green rectangle at (320, 135) with width 30 and height 62.
; PLAN: r0=320(x), r1=135(y), r2=30(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 135
LDI r2, 30
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
