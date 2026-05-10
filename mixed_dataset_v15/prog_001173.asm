; DESCRIPTION: Draws a purple rectangle at (109, 159) with width 16 and height 92.
; PLAN: r0=109(x), r1=159(y), r2=16(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 159
LDI r2, 16
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
