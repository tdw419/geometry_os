; DESCRIPTION: Draws a blue rectangle at (118, 116) with width 72 and height 101.
; PLAN: r0=118(x), r1=116(y), r2=72(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 116
LDI r2, 72
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
