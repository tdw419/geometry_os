; DESCRIPTION: Draws a orange rectangle at (320, 96) with width 29 and height 62.
; PLAN: r0=320(x), r1=96(y), r2=29(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 96
LDI r2, 29
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
