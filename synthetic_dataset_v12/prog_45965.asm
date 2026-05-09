; DESCRIPTION: Draws a red rectangle at (363, 52) with width 43 and height 107.
; PLAN: r0=363(x), r1=52(y), r2=43(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 52
LDI r2, 43
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
