; DESCRIPTION: Draws a green rectangle at (411, 29) with width 23 and height 74.
; PLAN: r0=411(x), r1=29(y), r2=23(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 29
LDI r2, 23
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
