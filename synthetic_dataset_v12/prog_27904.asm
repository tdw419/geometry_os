; DESCRIPTION: Draws a orange rectangle at (340, 49) with width 30 and height 114.
; PLAN: r0=340(x), r1=49(y), r2=30(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 49
LDI r2, 30
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
