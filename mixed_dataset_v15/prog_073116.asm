; DESCRIPTION: Draws a green rectangle at (261, 72) with width 54 and height 95.
; PLAN: r0=261(x), r1=72(y), r2=54(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 72
LDI r2, 54
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
