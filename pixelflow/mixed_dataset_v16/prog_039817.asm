; DESCRIPTION: Draws a green rectangle at (244, 29) with width 59 and height 38.
; PLAN: r0=244(x), r1=29(y), r2=59(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 29
LDI r2, 59
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
