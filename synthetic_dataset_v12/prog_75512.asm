; DESCRIPTION: Draws a orange rectangle at (333, 22) with width 15 and height 38.
; PLAN: r0=333(x), r1=22(y), r2=15(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 22
LDI r2, 15
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
