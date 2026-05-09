; DESCRIPTION: Draws a orange rectangle at (178, 121) with width 28 and height 43.
; PLAN: r0=178(x), r1=121(y), r2=28(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 121
LDI r2, 28
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
