; DESCRIPTION: Draws a orange rectangle at (164, 29) with width 101 and height 76.
; PLAN: r0=164(x), r1=29(y), r2=101(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 29
LDI r2, 101
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
