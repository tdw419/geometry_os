; DESCRIPTION: Draws a orange rectangle at (151, 17) with width 62 and height 13.
; PLAN: r0=151(x), r1=17(y), r2=62(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 17
LDI r2, 62
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
