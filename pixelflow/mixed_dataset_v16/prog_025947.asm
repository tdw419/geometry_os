; DESCRIPTION: Draws a purple rectangle at (154, 41) with width 93 and height 28.
; PLAN: r0=154(x), r1=41(y), r2=93(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 41
LDI r2, 93
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
