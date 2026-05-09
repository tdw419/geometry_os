; DESCRIPTION: Draws a orange rectangle at (246, 60) with width 11 and height 21.
; PLAN: r0=246(x), r1=60(y), r2=11(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 60
LDI r2, 11
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
