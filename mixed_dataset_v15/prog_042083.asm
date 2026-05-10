; DESCRIPTION: Draws a green rectangle at (338, 134) with width 113 and height 78.
; PLAN: r0=338(x), r1=134(y), r2=113(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 134
LDI r2, 113
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
