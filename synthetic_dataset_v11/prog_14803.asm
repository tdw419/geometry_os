; DESCRIPTION: Draws a orange rectangle at (118, 86) with width 109 and height 22.
; PLAN: r0=118(x), r1=86(y), r2=109(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 86
LDI r2, 109
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
