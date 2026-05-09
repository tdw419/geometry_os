; DESCRIPTION: Draws a cyan rectangle at (40, 104) with width 41 and height 89.
; PLAN: r0=40(x), r1=104(y), r2=41(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 104
LDI r2, 41
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
