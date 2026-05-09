; DESCRIPTION: Draws a orange rectangle at (467, 157) with width 19 and height 15.
; PLAN: r0=467(x), r1=157(y), r2=19(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 157
LDI r2, 19
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
