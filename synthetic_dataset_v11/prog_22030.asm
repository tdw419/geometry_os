; DESCRIPTION: Draws a purple rectangle at (8, 41) with width 42 and height 30.
; PLAN: r0=8(x), r1=41(y), r2=42(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 41
LDI r2, 42
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
