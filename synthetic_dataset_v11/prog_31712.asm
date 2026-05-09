; DESCRIPTION: Draws a red rectangle at (1, 13) with width 34 and height 114.
; PLAN: r0=1(x), r1=13(y), r2=34(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 13
LDI r2, 34
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
