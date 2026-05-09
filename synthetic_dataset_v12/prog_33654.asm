; DESCRIPTION: Draws a orange rectangle at (22, 131) with width 105 and height 26.
; PLAN: r0=22(x), r1=131(y), r2=105(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 131
LDI r2, 105
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
