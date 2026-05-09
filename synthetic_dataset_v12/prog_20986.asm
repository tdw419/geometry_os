; DESCRIPTION: Draws a orange rectangle at (136, 41) with width 56 and height 103.
; PLAN: r0=136(x), r1=41(y), r2=56(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 41
LDI r2, 56
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
