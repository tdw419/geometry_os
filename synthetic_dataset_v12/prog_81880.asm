; DESCRIPTION: Draws a orange rectangle at (167, 178) with width 55 and height 14.
; PLAN: r0=167(x), r1=178(y), r2=55(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 178
LDI r2, 55
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
