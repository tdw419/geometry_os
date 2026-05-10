; DESCRIPTION: Draws a red rectangle at (6, 38) with width 101 and height 83.
; PLAN: r0=6(x), r1=38(y), r2=101(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 38
LDI r2, 101
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
