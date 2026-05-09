; DESCRIPTION: Draws a red rectangle at (74, 58) with width 101 and height 79.
; PLAN: r0=74(x), r1=58(y), r2=101(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 58
LDI r2, 101
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
