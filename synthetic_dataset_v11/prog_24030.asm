; DESCRIPTION: Draws a orange rectangle at (47, 27) with width 102 and height 66.
; PLAN: r0=47(x), r1=27(y), r2=102(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 27
LDI r2, 102
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
