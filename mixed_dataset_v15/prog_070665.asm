; DESCRIPTION: Draws a red rectangle at (458, 156) with width 29 and height 83.
; PLAN: r0=458(x), r1=156(y), r2=29(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 156
LDI r2, 29
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
