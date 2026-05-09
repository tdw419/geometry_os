; DESCRIPTION: Draws a orange rectangle at (126, 9) with width 116 and height 15.
; PLAN: r0=126(x), r1=9(y), r2=116(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 9
LDI r2, 116
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
