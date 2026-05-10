; DESCRIPTION: Draws a orange rectangle at (277, 100) with width 49 and height 41.
; PLAN: r0=277(x), r1=100(y), r2=49(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 100
LDI r2, 49
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
