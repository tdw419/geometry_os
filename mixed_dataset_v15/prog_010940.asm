; DESCRIPTION: Draws a orange rectangle at (213, 105) with width 98 and height 101.
; PLAN: r0=213(x), r1=105(y), r2=98(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 105
LDI r2, 98
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
