; DESCRIPTION: Draws a orange rectangle at (163, 172) with width 68 and height 61.
; PLAN: r0=163(x), r1=172(y), r2=68(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 172
LDI r2, 68
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
