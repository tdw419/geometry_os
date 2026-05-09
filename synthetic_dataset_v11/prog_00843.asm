; DESCRIPTION: Draws a orange rectangle at (151, 96) with width 16 and height 114.
; PLAN: r0=151(x), r1=96(y), r2=16(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 96
LDI r2, 16
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
