; DESCRIPTION: Draws a red rectangle at (184, 8) with width 88 and height 115.
; PLAN: r0=184(x), r1=8(y), r2=88(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 88
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
