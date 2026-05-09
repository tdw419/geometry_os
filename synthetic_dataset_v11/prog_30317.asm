; DESCRIPTION: Draws a orange rectangle at (64, 76) with width 26 and height 107.
; PLAN: r0=64(x), r1=76(y), r2=26(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 76
LDI r2, 26
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
