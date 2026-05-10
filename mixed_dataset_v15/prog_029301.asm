; DESCRIPTION: Draws a orange rectangle at (230, 122) with width 40 and height 82.
; PLAN: r0=230(x), r1=122(y), r2=40(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 122
LDI r2, 40
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
