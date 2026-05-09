; DESCRIPTION: Draws a green rectangle at (61, 157) with width 41 and height 20.
; PLAN: r0=61(x), r1=157(y), r2=41(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 157
LDI r2, 41
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
