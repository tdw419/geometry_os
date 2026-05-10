; DESCRIPTION: Draws a green rectangle at (183, 41) with width 11 and height 57.
; PLAN: r0=183(x), r1=41(y), r2=11(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 41
LDI r2, 11
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
