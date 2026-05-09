; DESCRIPTION: Draws a orange rectangle at (35, 172) with width 101 and height 50.
; PLAN: r0=35(x), r1=172(y), r2=101(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 172
LDI r2, 101
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
