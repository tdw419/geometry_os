; DESCRIPTION: Draws a orange rectangle at (207, 101) with width 87 and height 74.
; PLAN: r0=207(x), r1=101(y), r2=87(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 101
LDI r2, 87
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
