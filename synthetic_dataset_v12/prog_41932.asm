; DESCRIPTION: Draws a orange rectangle at (121, 40) with width 72 and height 89.
; PLAN: r0=121(x), r1=40(y), r2=72(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 40
LDI r2, 72
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
