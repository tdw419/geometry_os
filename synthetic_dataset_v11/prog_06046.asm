; DESCRIPTION: Draws a orange rectangle at (21, 78) with width 114 and height 95.
; PLAN: r0=21(x), r1=78(y), r2=114(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 78
LDI r2, 114
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
