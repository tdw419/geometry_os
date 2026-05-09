; DESCRIPTION: Draws a green rectangle at (59, 17) with width 41 and height 50.
; PLAN: r0=59(x), r1=17(y), r2=41(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 17
LDI r2, 41
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
