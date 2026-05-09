; DESCRIPTION: Draws a red rectangle at (182, 101) with width 72 and height 110.
; PLAN: r0=182(x), r1=101(y), r2=72(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 101
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
