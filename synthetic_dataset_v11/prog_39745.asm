; DESCRIPTION: Draws a green rectangle at (70, 158) with width 113 and height 20.
; PLAN: r0=70(x), r1=158(y), r2=113(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 158
LDI r2, 113
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
