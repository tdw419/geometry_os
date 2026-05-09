; DESCRIPTION: Draws a orange rectangle at (43, 56) with width 71 and height 91.
; PLAN: r0=43(x), r1=56(y), r2=71(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 56
LDI r2, 71
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
