; DESCRIPTION: Draws a green rectangle at (161, 165) with width 90 and height 78.
; PLAN: r0=161(x), r1=165(y), r2=90(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 165
LDI r2, 90
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
