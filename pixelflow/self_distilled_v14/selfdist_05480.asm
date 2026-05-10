; DESCRIPTION: Draws a orange rectangle at (356, 116) with width 44 and height 97.
; PLAN: r0=356(x), r1=116(y), r2=44(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 116
LDI r2, 44
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
