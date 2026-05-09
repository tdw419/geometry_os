; DESCRIPTION: Draws a purple rectangle at (427, 42) with width 41 and height 41.
; PLAN: r0=427(x), r1=42(y), r2=41(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 42
LDI r2, 41
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
