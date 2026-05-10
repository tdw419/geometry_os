; DESCRIPTION: Draws a orange rectangle at (137, 104) with width 43 and height 42.
; PLAN: r0=137(x), r1=104(y), r2=43(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 104
LDI r2, 43
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
