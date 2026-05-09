; DESCRIPTION: Draws a green rectangle at (330, 41) with width 61 and height 101.
; PLAN: r0=330(x), r1=41(y), r2=61(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 41
LDI r2, 61
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
