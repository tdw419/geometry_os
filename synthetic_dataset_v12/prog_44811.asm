; DESCRIPTION: Draws a purple rectangle at (128, 164) with width 96 and height 41.
; PLAN: r0=128(x), r1=164(y), r2=96(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 164
LDI r2, 96
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
