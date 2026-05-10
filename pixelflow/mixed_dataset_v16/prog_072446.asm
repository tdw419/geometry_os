; DESCRIPTION: Draws a purple rectangle at (215, 109) with width 41 and height 77.
; PLAN: r0=215(x), r1=109(y), r2=41(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 109
LDI r2, 41
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
