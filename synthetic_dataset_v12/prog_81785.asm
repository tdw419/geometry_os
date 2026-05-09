; DESCRIPTION: Draws a red rectangle at (99, 105) with width 86 and height 15.
; PLAN: r0=99(x), r1=105(y), r2=86(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 105
LDI r2, 86
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
