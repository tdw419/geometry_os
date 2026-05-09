; DESCRIPTION: Draws a orange rectangle at (39, 26) with width 98 and height 101.
; PLAN: r0=39(x), r1=26(y), r2=98(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 26
LDI r2, 98
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
