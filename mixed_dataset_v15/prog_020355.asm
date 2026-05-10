; DESCRIPTION: Draws a orange rectangle at (455, 115) with width 43 and height 107.
; PLAN: r0=455(x), r1=115(y), r2=43(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 115
LDI r2, 43
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
