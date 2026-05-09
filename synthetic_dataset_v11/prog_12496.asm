; DESCRIPTION: Draws a purple rectangle at (95, 64) with width 116 and height 58.
; PLAN: r0=95(x), r1=64(y), r2=116(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 64
LDI r2, 116
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
