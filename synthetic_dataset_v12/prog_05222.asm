; DESCRIPTION: Draws a green rectangle at (380, 38) with width 41 and height 112.
; PLAN: r0=380(x), r1=38(y), r2=41(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 38
LDI r2, 41
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
