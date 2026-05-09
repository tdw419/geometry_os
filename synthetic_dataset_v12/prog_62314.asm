; DESCRIPTION: Draws a red rectangle at (276, 14) with width 25 and height 34.
; PLAN: r0=276(x), r1=14(y), r2=25(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 14
LDI r2, 25
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
