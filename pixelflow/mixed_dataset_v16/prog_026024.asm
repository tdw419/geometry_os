; DESCRIPTION: Draws a orange rectangle at (137, 18) with width 62 and height 27.
; PLAN: r0=137(x), r1=18(y), r2=62(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 18
LDI r2, 62
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
