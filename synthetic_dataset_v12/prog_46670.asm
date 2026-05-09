; DESCRIPTION: Draws a green rectangle at (394, 136) with width 74 and height 43.
; PLAN: r0=394(x), r1=136(y), r2=74(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 136
LDI r2, 74
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
