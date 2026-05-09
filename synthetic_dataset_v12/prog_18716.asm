; DESCRIPTION: Draws a green rectangle at (232, 58) with width 65 and height 109.
; PLAN: r0=232(x), r1=58(y), r2=65(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 65
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
