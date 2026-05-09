; DESCRIPTION: Draws a orange rectangle at (471, 173) with width 39 and height 15.
; PLAN: r0=471(x), r1=173(y), r2=39(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 173
LDI r2, 39
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
