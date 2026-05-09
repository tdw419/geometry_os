; DESCRIPTION: Draws a orange rectangle at (287, 125) with width 28 and height 66.
; PLAN: r0=287(x), r1=125(y), r2=28(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 125
LDI r2, 28
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
