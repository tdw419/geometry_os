; DESCRIPTION: Draws a green rectangle at (40, 75) with width 113 and height 78.
; PLAN: r0=40(x), r1=75(y), r2=113(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 75
LDI r2, 113
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
