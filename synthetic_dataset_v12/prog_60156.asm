; DESCRIPTION: Draws a red rectangle at (324, 16) with width 78 and height 88.
; PLAN: r0=324(x), r1=16(y), r2=78(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 16
LDI r2, 78
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
