; DESCRIPTION: Draws a red rectangle at (58, 160) with width 106 and height 81.
; PLAN: r0=58(x), r1=160(y), r2=106(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 160
LDI r2, 106
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
