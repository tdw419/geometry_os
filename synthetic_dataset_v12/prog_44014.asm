; DESCRIPTION: Draws a green rectangle at (289, 210) with width 56 and height 41.
; PLAN: r0=289(x), r1=210(y), r2=56(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 210
LDI r2, 56
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
