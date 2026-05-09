; DESCRIPTION: Draws a orange rectangle at (139, 79) with width 103 and height 116.
; PLAN: r0=139(x), r1=79(y), r2=103(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 79
LDI r2, 103
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
