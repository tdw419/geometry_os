; DESCRIPTION: Draws a green rectangle at (324, 215) with width 11 and height 41.
; PLAN: r0=324(x), r1=215(y), r2=11(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 215
LDI r2, 11
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
