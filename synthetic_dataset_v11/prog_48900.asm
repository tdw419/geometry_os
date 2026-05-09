; DESCRIPTION: Draws a red rectangle at (115, 97) with width 18 and height 78.
; PLAN: r0=115(x), r1=97(y), r2=18(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 97
LDI r2, 18
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
