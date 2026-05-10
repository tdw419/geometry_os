; DESCRIPTION: Draws a orange rectangle at (128, 72) with width 70 and height 74.
; PLAN: r0=128(x), r1=72(y), r2=70(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 72
LDI r2, 70
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
