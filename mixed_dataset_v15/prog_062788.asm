; DESCRIPTION: Draws a green rectangle at (62, 39) with width 29 and height 117.
; PLAN: r0=62(x), r1=39(y), r2=29(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 39
LDI r2, 29
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
