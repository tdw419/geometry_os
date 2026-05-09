; DESCRIPTION: Draws a orange rectangle at (2, 25) with width 100 and height 16.
; PLAN: r0=2(x), r1=25(y), r2=100(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 25
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
