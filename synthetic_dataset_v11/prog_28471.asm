; DESCRIPTION: Draws a orange rectangle at (10, 240) with width 118 and height 16.
; PLAN: r0=10(x), r1=240(y), r2=118(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 240
LDI r2, 118
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
