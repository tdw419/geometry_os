; DESCRIPTION: Draws a orange rectangle at (236, 111) with width 66 and height 41.
; PLAN: r0=236(x), r1=111(y), r2=66(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 111
LDI r2, 66
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
