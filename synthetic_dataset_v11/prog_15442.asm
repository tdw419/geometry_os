; DESCRIPTION: Draws a red rectangle at (84, 80) with width 80 and height 101.
; PLAN: r0=84(x), r1=80(y), r2=80(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 80
LDI r2, 80
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
