; DESCRIPTION: Draws a orange rectangle at (246, 77) with width 14 and height 30.
; PLAN: r0=246(x), r1=77(y), r2=14(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 77
LDI r2, 14
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
