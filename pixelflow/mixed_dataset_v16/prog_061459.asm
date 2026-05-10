; DESCRIPTION: Draws a red rectangle at (35, 118) with width 39 and height 31.
; PLAN: r0=35(x), r1=118(y), r2=39(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 118
LDI r2, 39
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
