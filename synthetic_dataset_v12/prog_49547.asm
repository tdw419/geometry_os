; DESCRIPTION: Draws a orange rectangle at (53, 24) with width 22 and height 20.
; PLAN: r0=53(x), r1=24(y), r2=22(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 24
LDI r2, 22
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
