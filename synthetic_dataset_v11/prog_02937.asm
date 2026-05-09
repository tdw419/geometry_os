; DESCRIPTION: Draws a orange rectangle at (117, 16) with width 102 and height 43.
; PLAN: r0=117(x), r1=16(y), r2=102(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 16
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
