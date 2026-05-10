; DESCRIPTION: Draws a red rectangle at (249, 19) with width 88 and height 14.
; PLAN: r0=249(x), r1=19(y), r2=88(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 19
LDI r2, 88
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
