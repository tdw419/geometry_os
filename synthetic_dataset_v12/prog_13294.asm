; DESCRIPTION: Draws a orange rectangle at (244, 56) with width 96 and height 86.
; PLAN: r0=244(x), r1=56(y), r2=96(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 56
LDI r2, 96
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
