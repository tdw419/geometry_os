; DESCRIPTION: Draws a orange rectangle at (8, 13) with width 111 and height 41.
; PLAN: r0=8(x), r1=13(y), r2=111(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 13
LDI r2, 111
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
