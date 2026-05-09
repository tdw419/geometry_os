; DESCRIPTION: Draws a orange rectangle at (405, 116) with width 30 and height 118.
; PLAN: r0=405(x), r1=116(y), r2=30(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 116
LDI r2, 30
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
