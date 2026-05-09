; DESCRIPTION: Draws a purple rectangle at (187, 57) with width 41 and height 118.
; PLAN: r0=187(x), r1=57(y), r2=41(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 57
LDI r2, 41
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
