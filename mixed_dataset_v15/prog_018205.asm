; DESCRIPTION: Draws a red rectangle at (438, 88) with width 45 and height 74.
; PLAN: r0=438(x), r1=88(y), r2=45(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 88
LDI r2, 45
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
