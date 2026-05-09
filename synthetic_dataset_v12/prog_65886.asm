; DESCRIPTION: Draws a red rectangle at (182, 36) with width 81 and height 90.
; PLAN: r0=182(x), r1=36(y), r2=81(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 36
LDI r2, 81
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
