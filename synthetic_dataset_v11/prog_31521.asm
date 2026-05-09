; DESCRIPTION: Draws a cyan rectangle at (132, 221) with width 41 and height 18.
; PLAN: r0=132(x), r1=221(y), r2=41(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 221
LDI r2, 41
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
