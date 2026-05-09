; DESCRIPTION: Draws a white rectangle at (359, 121) with width 59 and height 62.
; PLAN: r0=359(x), r1=121(y), r2=59(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 121
LDI r2, 59
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
