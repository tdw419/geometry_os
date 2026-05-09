; DESCRIPTION: Draws a green rectangle at (84, 58) with width 90 and height 83.
; PLAN: r0=84(x), r1=58(y), r2=90(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 58
LDI r2, 90
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
