; DESCRIPTION: Draws a red rectangle at (382, 15) with width 26 and height 38.
; PLAN: r0=382(x), r1=15(y), r2=26(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 15
LDI r2, 26
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
