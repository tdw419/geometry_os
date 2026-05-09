; DESCRIPTION: Draws a red rectangle at (339, 27) with width 34 and height 62.
; PLAN: r0=339(x), r1=27(y), r2=34(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 27
LDI r2, 34
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
