; DESCRIPTION: Draws a orange rectangle at (246, 68) with width 58 and height 25.
; PLAN: r0=246(x), r1=68(y), r2=58(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 68
LDI r2, 58
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
