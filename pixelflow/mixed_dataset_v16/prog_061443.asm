; DESCRIPTION: Draws a orange rectangle at (76, 143) with width 104 and height 63.
; PLAN: r0=76(x), r1=143(y), r2=104(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 143
LDI r2, 104
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
