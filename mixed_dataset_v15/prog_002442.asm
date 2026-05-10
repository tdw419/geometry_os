; DESCRIPTION: Draws a orange rectangle at (268, 128) with width 101 and height 105.
; PLAN: r0=268(x), r1=128(y), r2=101(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 128
LDI r2, 101
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
