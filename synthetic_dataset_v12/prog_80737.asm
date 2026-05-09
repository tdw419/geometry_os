; DESCRIPTION: Draws a orange rectangle at (265, 11) with width 55 and height 56.
; PLAN: r0=265(x), r1=11(y), r2=55(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 11
LDI r2, 55
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
