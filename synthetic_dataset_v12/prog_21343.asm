; DESCRIPTION: Draws a orange rectangle at (399, 167) with width 21 and height 62.
; PLAN: r0=399(x), r1=167(y), r2=21(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 167
LDI r2, 21
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
