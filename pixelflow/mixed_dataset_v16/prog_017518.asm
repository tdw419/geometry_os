; DESCRIPTION: Draws a orange rectangle at (144, 52) with width 50 and height 107.
; PLAN: r0=144(x), r1=52(y), r2=50(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 52
LDI r2, 50
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
