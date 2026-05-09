; DESCRIPTION: Draws a red rectangle at (344, 52) with width 98 and height 47.
; PLAN: r0=344(x), r1=52(y), r2=98(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 52
LDI r2, 98
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
