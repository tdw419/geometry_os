; DESCRIPTION: Draws a orange rectangle at (344, 56) with width 109 and height 44.
; PLAN: r0=344(x), r1=56(y), r2=109(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 56
LDI r2, 109
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
