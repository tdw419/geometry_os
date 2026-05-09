; DESCRIPTION: Draws a red rectangle at (43, 16) with width 88 and height 51.
; PLAN: r0=43(x), r1=16(y), r2=88(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 16
LDI r2, 88
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
