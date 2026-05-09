; DESCRIPTION: Draws a red rectangle at (158, 107) with width 76 and height 43.
; PLAN: r0=158(x), r1=107(y), r2=76(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 107
LDI r2, 76
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
