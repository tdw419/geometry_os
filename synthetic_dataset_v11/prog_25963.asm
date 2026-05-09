; DESCRIPTION: Draws a red rectangle at (102, 85) with width 107 and height 94.
; PLAN: r0=102(x), r1=85(y), r2=107(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 85
LDI r2, 107
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
