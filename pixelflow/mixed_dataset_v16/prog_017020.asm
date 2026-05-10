; DESCRIPTION: Draws a green rectangle at (13, 84) with width 59 and height 11.
; PLAN: r0=13(x), r1=84(y), r2=59(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 84
LDI r2, 59
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
