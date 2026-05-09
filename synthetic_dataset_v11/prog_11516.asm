; DESCRIPTION: Draws a purple rectangle at (116, 166) with width 48 and height 75.
; PLAN: r0=116(x), r1=166(y), r2=48(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 166
LDI r2, 48
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
