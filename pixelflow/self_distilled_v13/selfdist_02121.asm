; DESCRIPTION: Draws a cyan rectangle at (51, 160) with width 41 and height 71.
; PLAN: r0=51(x), r1=160(y), r2=41(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 160
LDI r2, 41
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
