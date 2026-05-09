; DESCRIPTION: Draws a orange rectangle at (64, 141) with width 56 and height 97.
; PLAN: r0=64(x), r1=141(y), r2=56(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 141
LDI r2, 56
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
