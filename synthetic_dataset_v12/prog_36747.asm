; DESCRIPTION: Draws a red rectangle at (143, 109) with width 26 and height 88.
; PLAN: r0=143(x), r1=109(y), r2=26(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 109
LDI r2, 26
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
