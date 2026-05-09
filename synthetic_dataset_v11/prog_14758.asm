; DESCRIPTION: Draws a purple rectangle at (128, 165) with width 67 and height 77.
; PLAN: r0=128(x), r1=165(y), r2=67(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 165
LDI r2, 67
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
