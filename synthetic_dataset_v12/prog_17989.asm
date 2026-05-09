; DESCRIPTION: Draws a orange rectangle at (122, 128) with width 50 and height 74.
; PLAN: r0=122(x), r1=128(y), r2=50(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 128
LDI r2, 50
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
