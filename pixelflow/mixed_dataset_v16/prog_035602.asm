; DESCRIPTION: Draws a red rectangle at (326, 100) with width 117 and height 118.
; PLAN: r0=326(x), r1=100(y), r2=117(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 100
LDI r2, 117
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
