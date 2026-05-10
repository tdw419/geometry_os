; DESCRIPTION: Draws a purple rectangle at (68, 150) with width 116 and height 109.
; PLAN: r0=68(x), r1=150(y), r2=116(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 150
LDI r2, 116
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
