; DESCRIPTION: Draws a orange rectangle at (370, 118) with width 56 and height 30.
; PLAN: r0=370(x), r1=118(y), r2=56(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 118
LDI r2, 56
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
