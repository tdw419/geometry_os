; DESCRIPTION: Draws a red rectangle at (14, 26) with width 109 and height 74.
; PLAN: r0=14(x), r1=26(y), r2=109(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 26
LDI r2, 109
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
