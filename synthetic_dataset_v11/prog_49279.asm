; DESCRIPTION: Draws a red rectangle at (66, 118) with width 57 and height 11.
; PLAN: r0=66(x), r1=118(y), r2=57(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 118
LDI r2, 57
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
