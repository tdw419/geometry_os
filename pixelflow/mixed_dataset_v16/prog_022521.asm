; DESCRIPTION: Draws a red rectangle at (115, 54) with width 26 and height 62.
; PLAN: r0=115(x), r1=54(y), r2=26(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 54
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
