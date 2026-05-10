; DESCRIPTION: Draws a green rectangle at (481, 84) with width 28 and height 83.
; PLAN: r0=481(x), r1=84(y), r2=28(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 84
LDI r2, 28
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
