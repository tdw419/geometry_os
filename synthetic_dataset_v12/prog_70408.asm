; DESCRIPTION: Draws a orange rectangle at (434, 16) with width 41 and height 84.
; PLAN: r0=434(x), r1=16(y), r2=41(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 16
LDI r2, 41
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
