; DESCRIPTION: Draws a purple rectangle at (327, 116) with width 108 and height 68.
; PLAN: r0=327(x), r1=116(y), r2=108(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 116
LDI r2, 108
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
