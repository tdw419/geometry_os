; DESCRIPTION: Draws a green rectangle at (382, 84) with width 74 and height 62.
; PLAN: r0=382(x), r1=84(y), r2=74(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 84
LDI r2, 74
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
