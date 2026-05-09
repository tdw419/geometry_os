; DESCRIPTION: Draws a orange rectangle at (252, 21) with width 77 and height 43.
; PLAN: r0=252(x), r1=21(y), r2=77(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 21
LDI r2, 77
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
