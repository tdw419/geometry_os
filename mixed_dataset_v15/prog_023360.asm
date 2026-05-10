; DESCRIPTION: Draws a green rectangle at (296, 138) with width 48 and height 43.
; PLAN: r0=296(x), r1=138(y), r2=48(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 138
LDI r2, 48
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
