; DESCRIPTION: Draws a magenta rectangle at (116, 41) with width 63 and height 104.
; PLAN: r0=116(x), r1=41(y), r2=63(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 41
LDI r2, 63
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
