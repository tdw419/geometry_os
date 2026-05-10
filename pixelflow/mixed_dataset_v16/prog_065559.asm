; DESCRIPTION: Draws a orange rectangle at (365, 68) with width 25 and height 62.
; PLAN: r0=365(x), r1=68(y), r2=25(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 68
LDI r2, 25
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
