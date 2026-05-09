; DESCRIPTION: Draws a green rectangle at (64, 160) with width 47 and height 41.
; PLAN: r0=64(x), r1=160(y), r2=47(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 160
LDI r2, 47
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
