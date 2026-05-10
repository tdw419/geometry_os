; DESCRIPTION: Draws a orange rectangle at (197, 5) with width 63 and height 41.
; PLAN: r0=197(x), r1=5(y), r2=63(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 5
LDI r2, 63
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
