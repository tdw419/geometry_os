; DESCRIPTION: Draws a orange rectangle at (0, 86) with width 95 and height 101.
; PLAN: r0=0(x), r1=86(y), r2=95(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 86
LDI r2, 95
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
