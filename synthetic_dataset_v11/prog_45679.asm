; DESCRIPTION: Draws a blue rectangle at (41, 183) with width 26 and height 56.
; PLAN: r0=41(x), r1=183(y), r2=26(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 183
LDI r2, 26
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
