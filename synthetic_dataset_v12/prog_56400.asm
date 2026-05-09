; DESCRIPTION: Draws a orange rectangle at (16, 72) with width 25 and height 23.
; PLAN: r0=16(x), r1=72(y), r2=25(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 72
LDI r2, 25
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
