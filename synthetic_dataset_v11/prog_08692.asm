; DESCRIPTION: Draws a orange rectangle at (13, 153) with width 42 and height 41.
; PLAN: r0=13(x), r1=153(y), r2=42(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 153
LDI r2, 42
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
