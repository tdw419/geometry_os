; DESCRIPTION: Draws a red rectangle at (344, 133) with width 85 and height 117.
; PLAN: r0=344(x), r1=133(y), r2=85(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 133
LDI r2, 85
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
